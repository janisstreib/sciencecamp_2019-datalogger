#pragma once

#include <Arduino.h>
#include <DallasTemperature.h>

class DataSource {
    public:
        virtual String getYAxisName() = 0;
        virtual double getDataPoint() = 0;
        double lastData = 0;
};

class TemperatureDataSource: public DataSource {
    public:
        TemperatureDataSource(DallasTemperature* sensors): sensors(sensors) {}
        double getDataPoint();
        String getYAxisName(); 
    private:
        DallasTemperature* sensors;
};

class UltrasonicDistanceDataSource: public DataSource {
    public:
        UltrasonicDistanceDataSource(int echoPin, int triggerPin): echoPin(echoPin), triggerPin(triggerPin) {} 
        double getDataPoint();
        String getYAxisName();
    private:
        int echoPin, triggerPin;
};

class DataTarget;

class DataLogger {
    public:
        int initSession(DataSource *sources[], DataTarget *targets[]);
        int endSession(DataTarget *targets[]);
        double addDataPoint(DataSource* source, DataTarget* target, long time);
        long startTime = 0;
        long lastLog = 0;
        bool isLogging = false;
};

class DataTarget {
    public:
        virtual bool writeDataPoint(DataLogger *logger, long time, double data) = 0;
        virtual bool close() = 0;
        virtual bool open(DataSource *sources[]) = 0;
};

class SerialDataTarget: public DataTarget {
    public:
        bool writeDataPoint(DataLogger *logger, long time, double data);
        bool close();
        bool open(DataSource *sources[]);
};
