#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <OneWire.h>
#include <DallasTemperature.h>

#include "Logger.h"

#define FIRMWARE_VERSION "{VERSION}"
#define LOG_INTERVAL 1000

#define OWNER_NAME "Janis"
#define DEBUG

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 32 // OLED display height, in pixels

#define OLED_RESET     -1 // Reset pin # (or -1 if sharing Arduino reset pin)
#define ACTION_BUTTON 3
#define SD_DETECT 4
#define BAT_VOLTAGE_PIN A2
#define BAT_VOLTAGE_MULT 10
#define BAT_VOLTAGE_BIAS 1.13
#define ONE_WIRE_BUS 7
#define HC_SR_04_TRIG 6
#define HC_SR_04_ECHO 2


Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);
OneWire oneWire(ONE_WIRE_BUS);
DallasTemperature sensors(&oneWire);
DataLogger logger;
TemperatureDataSource tempDat(&sensors);
UltrasonicDistanceDataSource distDat(HC_SR_04_ECHO, HC_SR_04_TRIG);
SerialDataTarget serialTarget;

volatile unsigned long action_trgd = 0;
float bat_voltage = 0;
bool sd_present = false;
bool display_init = false;
bool action_state = false;
bool long_handled_for_press = false;

bool action_press_dispatch = false;
bool long_action_press_dispatch = false;
bool loop_tick = false;

int page = 0;

void setup() {
    Serial.begin(9600);
    Serial.print("SC_LOG v.");
    Serial.println(FIRMWARE_VERSION);
#ifdef DEBUG
    Serial.println(">>> DEBUG MODE <<<");
#endif
    pinMode(LED_BUILTIN, OUTPUT);
    pinMode(HC_SR_04_TRIG, OUTPUT);
    digitalWrite(HC_SR_04_TRIG, LOW);
    pinMode(HC_SR_04_ECHO, INPUT);
    if(!display.begin(SSD1306_SWITCHCAPVCC, 0x3C)) { // Address 0x3C for 128x32
        Serial.println(F("SSD1306 allocation failed"));
        Serial.println(F("Proceeding without display..."));
    } else {
        display.setRotation(2);
        display.clearDisplay();
        display.setTextSize(1);
        display.setTextColor(WHITE); // Draw white text
        display.setCursor(0, 0);     // Start at top-left corner
        display.cp437(true);         // Use full 256 char 'Code Page 437' font
        display.print("SC_LOG v.");
        display.println(FIRMWARE_VERSION);
        display.setTextSize(2);
        display.println(OWNER_NAME);
        display.display();
        display_init = true;
    }
    pinMode(SD_DETECT, INPUT);
    digitalWrite(SD_DETECT, HIGH);

    sensors.begin();

    pinMode(ACTION_BUTTON, INPUT);
    digitalWrite(ACTION_BUTTON, HIGH);
    delay(1200);
    action_state = digitalRead(ACTION_BUTTON);
    attachInterrupt(digitalPinToInterrupt(ACTION_BUTTON), handleActionButton, CHANGE);
}

void loop() {
    bool sd_was = sd_present;
    sd_present = !digitalRead(SD_DETECT);
    if(sd_was != sd_present) {
        if(sd_present) {
            debug("SD card inserted");
            sdInserted();
        } else {
            debug("SD card ejected");
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
        display.display();
    }
}

bool measure() {
    if(logger.isLogging && millis()-logger.lastLog < LOG_INTERVAL) {
        return false;
    }
    digitalWrite(LED_BUILTIN, HIGH);
    logger.addDataPoint(&tempDat, &serialTarget, millis());
    logger.addDataPoint(&distDat, &serialTarget, millis());
    digitalWrite(LED_BUILTIN, LOW);
    return true;
}

bool render(bool didMeasure) {
    if(!didMeasure) {
        return false;
    }
    display.clearDisplay();
    display.setCursor(0,0);
    display.setTextSize(1);
    display.print("Bat.: ");
    display.print(bat_voltage);
    display.println("V");
    switch(page){
        case 0:
            display.println(tempDat.getYAxisName());
            display.setTextSize(2);
            display.println(tempDat.lastData);
            break;
        case 1:
            display.println(distDat.getYAxisName());
            display.setTextSize(2);
            display.println(distDat.lastData);
            break;

    }
    if(logger.isLogging && loop_tick) {
        display.fillCircle(SCREEN_WIDTH - 9, 15, 4, WHITE);
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
                debug("long action press");
                if(long_action_press_dispatch) {
                    debug("previous long button event not handled yet!");
                }
                long_action_press_dispatch = true;
                long_handled_for_press = true;
            } else {
                debug("action press");
                long_handled_for_press = false;
                if(action_press_dispatch) {
                    debug("previous button event not handled!");
                }
                action_press_dispatch = true;
            }
        }
    }
    action_state = new_state;
}

void actionButtonPressed() {
    page++;
    page = page%2;
}

void actionButtonLongPressed() {
    DataTarget *targets[] = {&serialTarget};
    DataSource *sources[] = {&tempDat};
    if(logger.isLogging) {
        logger.endSession(targets);
    } else {
        logger.initSession(sources, targets);
    }
}

void sdInserted() {
}
void sdEjected() {
}

void debug(String str) {
#ifdef DEBUG
    Serial.print("[DEBUG] (");
    Serial.print(millis());
    Serial.print("): ");
    Serial.println(str);
#endif
}
