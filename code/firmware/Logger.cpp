#pragma once

#include "Logger.h"
#include <Arduino.h>
#include <math.h>

#define SONIC_SPEED 343.2f

int DataLogger::initSession(DataSource *sources[], DataTarget *targets[]) {
    if(this->isLogging) {
        return -1;
    }
    this->startTime = millis();
    for(int i=0;i<sizeof(targets)/sizeof(targets[0]);i++) {
        targets[i]->open(sources);
    }
    this->isLogging = true;
    return true;
}

int DataLogger::endSession(DataTarget *targets[]) {
    if(!this->isLogging) {
        return -1;
    }
    for(int i=0;i<sizeof(targets)/sizeof(targets[0]);i++) {
        targets[i]->close();   
    }
    this->isLogging = false;
    return true;
}

bool SerialDataTarget::writeDataPoint(DataLogger *logger, long time, double data) {
    Serial.print(millis()-logger->startTime);
    Serial.print(',');
    Serial.println(data);
    return true;
}

bool SerialDataTarget::close() {
    Serial.println("End of Logging.");
    return true;
}

bool SerialDataTarget::open(DataSource *sources[]) {
    Serial.println("Begin of logging.");
    Serial.print("Zeit (ms),");
    for(int i=0;i<sizeof(sources)/sizeof(sources[0]);i++) {
        Serial.print(sources[i]->getYAxisName());
    }
    Serial.println();
    return true;
}

double DataLogger::addDataPoint(DataSource* source, DataTarget* target, long time) {
    double point = source->getDataPoint();
    source->lastData = point;
    this->lastLog = time;
    if(!this->isLogging) {
        return point;
    }
    target->writeDataPoint(this, time, point);
    return point;
}

double TemperatureDataSource::getDataPoint() {
    this->sensors->requestTemperaturesByIndex(0);
    return this->sensors->getTempCByIndex(0);
}

String TemperatureDataSource::getYAxisName() {
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
String UltrasonicDistanceDataSource::getYAxisName() {
    char out[50];
    sprintf(out, "Distanz (cm @ %fm/s)", SONIC_SPEED);
    return out;
}
