#define SERIAL_RX_BUFFER_SIZE 1
#define SERIAL_TX_BUFFER_SIZE 32

#include <Arduino.h>

#include <SPI.h>
#include <SD.h>
#include <Wire.h>
#include <U8x8lib.h>
#include <OneWire.h>
#include <DallasTemperature.h>

#include "Logger.h"

#define FIRMWARE_VERSION "{VERSION}"
#define LOG_INTERVAL 1000

#define OWNER_NAME "Janis"
#define DEBUG

#define ACTION_BUTTON 3
#define SD_DETECT 4
#define BAT_VOLTAGE_PIN A2
#define BAT_VOLTAGE_MULT 10
#define BAT_VOLTAGE_BIAS 0
#define ONE_WIRE_BUS 7
#define HC_SR_04_TRIG 6
#define HC_SR_04_ECHO 2
#define SPI_CHIP_SELECT 10


U8X8_SSD1306_128X32_UNIVISION_HW_I2C u8x8(/* reset=*/ U8X8_PIN_NONE, /* clock=*/ SCL, /* data=*/ SDA);
//U8G2_SSD1306_128X32_UNIVISION_1_HW_I2C u8x8(1);
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);
DataLogger logger;
TemperatureDataSource tempDat(&sensors);
UltrasonicDistanceDataSource distDat(HC_SR_04_ECHO, HC_SR_04_TRIG);
SerialDataTarget serialTarget;
SDDataTarget sdTarget;

File sdRootDir;

volatile unsigned long action_trgd = 0;
double bat_voltage = 0;
bool sd_present = false;
bool sd_init = false;
bool display_init = false;
bool action_state = false;
bool long_handled_for_press = false;

bool action_press_dispatch = false;
bool long_action_press_dispatch = false;
bool loop_tick = false;

int page = 0;

const char convBuf[6];

void setup() {
    Serial.begin(9600);
    Serial.print(F("SC_LOG v."));
    Serial.println(FIRMWARE_VERSION);
#ifdef DEBUG
    Serial.println(F(">>> DEBUG MODE <<<"));
#endif
    pinMode(LED_BUILTIN, OUTPUT);
    pinMode(HC_SR_04_TRIG, OUTPUT);
    digitalWrite(HC_SR_04_TRIG, LOW);
    pinMode(HC_SR_04_ECHO, INPUT);
   // if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { // Address 0x3C for 128x32
   //     Serial.println(F("SSD1306 allocation failed"));
   //     Serial.println(F("Proceeding without display..."));
   // } else {
   //     display.setRotation(2);
   //     display.clearDisplay();
   //     display.setTextSize(1);
   //     display.setTextColor(WHITE); // Draw white text
   //     display.setCursor(0, 0);     // Start at top-left corner
   //     display.cp437(true);         // Use full 256 char 'Code Page 437' font
   //     display.print("SC_LOG v.");
   //     display.println(FIRMWARE_VERSION);
   //     display.setTextSize(2);
   //     display.println(OWNER_NAME);
   //     display.display();
        display_init = true;
   // }
    u8x8.begin();
    u8x8.setFlipMode(1);
    u8x8.setFont(u8x8_font_amstrad_cpc_extended_f);
    u8x8.clear();
    u8x8.print("hallo");
    pinMode(SD_DETECT, INPUT);
    digitalWrite(SD_DETECT, HIGH);

    sensors.begin();

    pinMode(ACTION_BUTTON, INPUT);
    digitalWrite(ACTION_BUTTON, HIGH);
    delay(1200);
    action_state = digitalRead(ACTION_BUTTON);
    attachInterrupt(digitalPinToInterrupt(ACTION_BUTTON), handleActionButton, CHANGE);
    u8x8.clear();
}

void loop() {
    bool sd_was = sd_present;
    sd_present = !digitalRead(SD_DETECT);
    if(sd_was != sd_present) {
        if(sd_present) {
            debug(F("SD card inserted"));
            sdInserted();
        } else {
            debug(F("SD card ejected"));
            sdEjected();
        }
    }
    bat_voltage = analogRead(BAT_VOLTAGE_PIN)/(1023.0/5.0)*10 + BAT_VOLTAGE_BIAS;
    if(action_press_dispatch) {
        actionButtonPressed();
        action_press_dispatch = false;
    }
    if(long_action_press_dispatch) {
        actionButtonLongPressed();
        long_action_press_dispatch = false;
    }
    bool didMeasure = measure();
    if(display_init && render(didMeasure)) {
//        display.display();
    }
}

bool measure() {
    if(logger.isLogging && millis()-logger.lastLog < LOG_INTERVAL) {
        return false;
    }
    digitalWrite(LED_BUILTIN, HIGH);
    long milli_mess = millis();
    DataTarget *targets[] = {&serialTarget, nullptr};
    if(sd_init) {
        targets[1] = &sdTarget;
    }
    logger.addDataPoint(&tempDat, targets, milli_mess, false, false);
    logger.addDataPoint(&distDat, targets, milli_mess, true, true);
    digitalWrite(LED_BUILTIN, LOW);
    return true;
}

bool render(bool didMeasure) {
    if(!didMeasure) {
        return false;
    }
    //u8x8.clear();
//    display.clearDisplay();
//    display.setCursor(0,0);
//    display.setTextSize(1);
//    display.print("Bat.: ");
//    display.print(bat_voltage);
//    display.println("V");
    switch(page){
        case 0:
            u8x8.drawUTF8(0,1,tempDat.getYAxisName());
            u8x8.setCursor(0,2);
            dtostrf(tempDat.lastData,5,2,convBuf);
            break;
        case 1:
            u8x8.drawUTF8(0,1,distDat.getYAxisName());
            dtostrf(distDat.lastData,5,2,convBuf);
            break;
        case 2:
            u8x8.drawUTF8(0,1, "Spannung (Vin)");
            dtostrf(bat_voltage, 5,2, convBuf);
            break;
    }
    u8x8.clearLine(2);
    u8x8.clearLine(3);
    u8x8.draw2x2String(0,2,convBuf);
    if(logger.isLogging) {
//        display.fillCircle(SCREEN_WIDTH - 9, 15, 4, WHITE);
        u8x8.setInverseFont(loop_tick);
        u8x8.drawString(u8x8.getCols()-3, 0, "Rec");
        u8x8.setInverseFont(false);
    } else {
        u8x8.drawString(u8x8.getCols()-3, 0, "   ");
    }

    u8x8.setInverseFont(sd_init);
    if(sd_init) {
        u8x8.drawString(u8x8.getCols()-6,0,"SD");
    }else {
        u8x8.drawString(u8x8.getCols()-6,0,"  ");
    }
    u8x8.setInverseFont(false);
    if(bat_voltage < 6) {
        u8x8.setInverseFont(loop_tick);
        u8x8.drawString(0,0,"Bat!");
        u8x8.setInverseFont(false);
    } else {
        u8x8.drawString(0,0,"    ");
    }
    loop_tick = !loop_tick;
    return true;
}

void handleActionButton() {
    bool new_state = digitalRead(ACTION_BUTTON);
    unsigned long del = millis() - action_trgd;
    if(del > 50 && millis() > 1000) { // debounce
        action_trgd = millis();
        if(new_state != action_state && new_state) {
            if(del >= 1000) {
                debug(F("long action press"));
                if(long_action_press_dispatch) {
                    debug(F("previous long button event not handled yet!"));
                }
                long_action_press_dispatch = true;
                long_handled_for_press = true;
            } else {
                debug(F("action press"));
                long_handled_for_press = false;
                if(action_press_dispatch) {
                    debug(F("previous button event not handled!"));
                }
                action_press_dispatch = true;
            }
        }
    }
    action_state = new_state;
}

void actionButtonPressed() {
    page++;
    page = page%3;
    u8x8.clearLine(1);
    u8x8.clearLine(2);
    u8x8.clearLine(3);
}

void actionButtonLongPressed() {
    DataTarget *targets[] = {&serialTarget, nullptr};
    if(sd_init) {
        targets[1] = &sdTarget;
    }
    DataSource *sources[] = {&tempDat, &distDat};
    if(logger.isLogging) {
        logger.endSession(targets);
    } else {
        logger.initSession(sources, targets);
    }
}

void sdInserted() {
    if(!SD.begin(SPI_CHIP_SELECT)){
        debug(F("Failed initializing SD Card"));
        return;
    }
    if(!SD.exists(F("/SC_LOG/"))) {
        if(!SD.mkdir(F("/SC_LOG"))) {
            debug(F("Failed to mkdir"));
            SD.end();
            return;
        }
    }
    sd_init = true;
}

void sdEjected() {
    if(sd_init) {
        SD.end();
    }
    sd_init = false;
}

void debug(const __FlashStringHelper *str) {
#ifdef DEBUG
    Serial.print(F("[DEBUG] ("));
    Serial.print(millis());
    Serial.print(F("): "));
    Serial.println(str);
#endif
}

