#pragma once

#include "Logger.h"
#include <Arduino.h>
#include <math.h>
#include <SD.h>

#define SONIC_SPEED 343.2f

int DataLogger::initSession(DataSource *sources[], DataTarget *targets[]) {
    if(this->isLogging) {
        return -1;
    }
    this->startTime = millis();
    for(int i=0;i<2;i++) {
        if(targets[i] == nullptr) {
            continue;
        }
        targets[i]->open(sources);
    }
    this->isLogging = true;
    return true;
}

int DataLogger::endSession(DataTarget *targets[]) {
    if(!this->isLogging) {
        return -1;
    }
    for(int i=0;i<2;i++) {
        targets[i]->close();   
    }
    this->isLogging = false;
    return true;
}

bool SerialDataTarget::writeDataPoint(DataLogger *logger, long time, double data, bool lineAppend = false, bool lineEnd = true) {
    if(!lineAppend) {
        Serial.print(millis()-logger->startTime);
    }
    Serial.print(',');
    Serial.print(data);
    if(lineEnd) {
        Serial.println();
    }
    return true;
}

bool SerialDataTarget::close() {
    Serial.println("End of Logging.");
    return true;
}

bool SerialDataTarget::open(DataSource *sources[]) {
    Serial.println("Begin of logging.");
    Serial.print("Zeit (ms)");
    for(int i=0;i<2;i++) {
        Serial.print(',');
        Serial.print(sources[i]->getYAxisName());
    }
    Serial.println();
    return true;
}

bool SDDataTarget::open(DataSource *sources[]) {
    sprintf(charbuf, "/SC_LOG/%d.csv",millis());
    this->file = SD.open(charbuf, O_READ | O_WRITE | O_CREAT | O_APPEND);
    this->file.print("Zeit (ms)");
    for(int i=0;i<(sizeof(sources)/sizeof(sources[0]));i++) {
        this->file.print(',');
        this->file.print(sources[i]->getYAxisName());
    }
    this->file.println();
    this->file.flush();
    return true;
}

bool SDDataTarget::close() {
    this->file.close();
    return true;
}

bool SDDataTarget::writeDataPoint(DataLogger *logger, long time, double data, bool lineAppend = false, bool lineEnd = true) {
    if(!lineAppend) {
        this->file.print(millis()-logger->startTime);
    }
    this->file.print(',');
    this->file.print(data);
    if(lineEnd) {
        this->file.println();
    }
    this->file.flush();
    return true;
}

double DataLogger::addDataPoint(DataSource* source, DataTarget *targets[], long time, bool append = false, bool lineEnd = true) {
    double point = source->getDataPoint();
    source->lastData = point;
    this->lastLog = time;
    if(!this->isLogging) {
        return point;
    }
    for(int i=0;i<2;i++) {
        if(targets[i] == nullptr) {
            continue;
        }
        targets[i]->writeDataPoint(this, time, point, append, lineEnd);
    }
    return point;
}

double TemperatureDataSource::getDataPoint() {
    this->sensors->requestTemperaturesByIndex(0);
    return this->sensors->getTempCByIndex(0);
}

const char* TemperatureDataSource::getYAxisName() {
    return "Temperatur (°C)";
}

double UltrasonicDistanceDataSource::getDataPoint() {
    digitalWrite(this->triggerPin, HIGH);
    delay(10);
    digitalWrite(this->triggerPin, LOW);
    long t = pulseIn(this->echoPin, HIGH);
    double dist = (t/2.0)*(SONIC_SPEED/10000);
    if(dist >= 500 || dist <= 0) {
        return NAN;        
    }
    return dist;
}
const char* UltrasonicDistanceDataSource::getYAxisName() {
    return "cm @ 343.2 m/s";
}
