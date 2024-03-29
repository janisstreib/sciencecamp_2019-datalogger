EESchema Schematic File Version 4
LIBS:sciencecamp_logger-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v2.x A1
U 1 1 5CEFFCE7
P 3350 3350
F 0 "A1" H 3350 2261 50  0000 C CNN
F 1 "Arduino Nano" H 2950 2350 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 3500 2400 50  0001 L CNN
F 3 "https://www.arduino.cc/en/uploads/Main/ArduinoNanoManual23.pdf" H 3350 2350 50  0001 C CNN
	1    3350 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:Battery BT1
U 1 1 5CF0083F
P 4200 1650
F 0 "BT1" H 4308 1696 50  0000 L CNN
F 1 "9V Battery" H 4308 1605 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 4200 1710 50  0001 C CNN
F 3 "~" V 4200 1710 50  0001 C CNN
	1    4200 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 1350 3250 1750
$Comp
L power:GND #PWR0101
U 1 1 5CF01397
P 4200 1850
F 0 "#PWR0101" H 4200 1600 50  0001 C CNN
F 1 "GND" H 4205 1677 50  0000 C CNN
F 2 "" H 4200 1850 50  0001 C CNN
F 3 "" H 4200 1850 50  0001 C CNN
	1    4200 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5CF016C3
P 3400 4450
F 0 "#PWR0102" H 3400 4200 50  0001 C CNN
F 1 "GND" H 3405 4277 50  0000 C CNN
F 2 "" H 3400 4450 50  0001 C CNN
F 3 "" H 3400 4450 50  0001 C CNN
	1    3400 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 4450 3450 4450
Wire Wire Line
	3450 4450 3450 4350
Wire Wire Line
	3400 4450 3350 4450
Wire Wire Line
	3350 4450 3350 4350
Connection ~ 3400 4450
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 5CF02BB4
P 5500 3600
F 0 "J3" H 5580 3592 50  0000 L CNN
F 1 "OLED" H 5580 3501 50  0000 L CNN
F 2 "parts:12832_SSD1306" H 5500 3600 50  0001 C CNN
F 3 "~" H 5500 3600 50  0001 C CNN
	1    5500 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5CF05D7F
P 4500 4450
F 0 "#PWR0103" H 4500 4200 50  0001 C CNN
F 1 "GND" H 4505 4277 50  0000 C CNN
F 2 "" H 4500 4450 50  0001 C CNN
F 3 "" H 4500 4450 50  0001 C CNN
	1    4500 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3500 4500 4450
$Comp
L power:+5V #PWR0104
U 1 1 5CF06726
P 4550 3350
F 0 "#PWR0104" H 4550 3200 50  0001 C CNN
F 1 "+5V" H 4565 3523 50  0000 C CNN
F 2 "" H 4550 3350 50  0001 C CNN
F 3 "" H 4550 3350 50  0001 C CNN
	1    4550 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3350 4550 3600
Text Label 4550 3700 0    50   ~ 0
SCL
Text Label 4550 3800 0    50   ~ 0
SDA
$Comp
L power:+5V #PWR0105
U 1 1 5CF07899
P 3550 2350
F 0 "#PWR0105" H 3550 2200 50  0001 C CNN
F 1 "+5V" H 3565 2523 50  0000 C CNN
F 2 "" H 3550 2350 50  0001 C CNN
F 3 "" H 3550 2350 50  0001 C CNN
	1    3550 2350
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0106
U 1 1 5CF07CA7
P 3450 2200
F 0 "#PWR0106" H 3450 2050 50  0001 C CNN
F 1 "+3V3" H 3465 2373 50  0000 C CNN
F 2 "" H 3450 2200 50  0001 C CNN
F 3 "" H 3450 2200 50  0001 C CNN
	1    3450 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2200 3450 2350
NoConn ~ 3850 2750
NoConn ~ 3850 2850
NoConn ~ 2850 2750
NoConn ~ 2850 2850
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 5CF114F3
P 950 2950
F 0 "J1" H 842 2625 50  0000 C CNN
F 1 "1-Wire" H 842 2716 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 950 2950 50  0001 C CNN
F 3 "~" H 950 2950 50  0001 C CNN
	1    950  2950
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 5CF12095
P 2250 2850
F 0 "#PWR0107" H 2250 2700 50  0001 C CNN
F 1 "+5V" H 2265 3023 50  0000 C CNN
F 2 "" H 2250 2850 50  0001 C CNN
F 3 "" H 2250 2850 50  0001 C CNN
	1    2250 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2850 1950 2850
$Comp
L power:GND #PWR0108
U 1 1 5CF161D1
P 1150 3050
F 0 "#PWR0108" H 1150 2800 50  0001 C CNN
F 1 "GND" H 1155 2877 50  0000 C CNN
F 2 "" H 1150 3050 50  0001 C CNN
F 3 "" H 1150 3050 50  0001 C CNN
	1    1150 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5CF1662C
P 1500 2550
F 0 "R1" H 1570 2596 50  0000 L CNN
F 1 "47k" H 1570 2505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 1430 2550 50  0001 C CNN
F 3 "~" H 1500 2550 50  0001 C CNN
	1    1500 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2950 1500 2700
Wire Wire Line
	1500 2950 1150 2950
Wire Wire Line
	1500 2400 1950 2400
Wire Wire Line
	1950 2400 1950 2850
Connection ~ 1950 2850
Wire Wire Line
	1950 2850 1150 2850
$Comp
L Connector:Conn_01x04_Female J2
U 1 1 5CF2D0DF
P 950 3900
F 0 "J2" H 842 4185 50  0000 C CNN
F 1 "HC-SR04" H 842 4094 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 950 3900 50  0001 C CNN
F 3 "~" H 950 3900 50  0001 C CNN
	1    950  3900
	-1   0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0109
U 1 1 5CF370B4
P 1550 3800
F 0 "#PWR0109" H 1550 3650 50  0001 C CNN
F 1 "+5V" H 1565 3973 50  0000 C CNN
F 2 "" H 1550 3800 50  0001 C CNN
F 3 "" H 1550 3800 50  0001 C CNN
	1    1550 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3800 1150 3800
$Comp
L power:GND #PWR0110
U 1 1 5CF37D36
P 1550 4100
F 0 "#PWR0110" H 1550 3850 50  0001 C CNN
F 1 "GND" H 1555 3927 50  0000 C CNN
F 2 "" H 1550 4100 50  0001 C CNN
F 3 "" H 1550 4100 50  0001 C CNN
	1    1550 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4100 1150 4100
$Comp
L Switch:SW_SPDT SW1
U 1 1 5CF3E246
P 3750 1350
F 0 "SW1" H 3750 1635 50  0000 C CNN
F 1 "OFF/ON" H 3750 1544 50  0000 C CNN
F 2 "parts:OS102011MA1QN1" H 3750 1350 50  0001 C CNN
F 3 "~" H 3750 1350 50  0001 C CNN
	1    3750 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1450 4200 1450
Wire Wire Line
	3250 1350 3550 1350
NoConn ~ 3950 1250
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 5CF4603A
P 3750 900
F 0 "JP1" H 3750 1135 50  0000 C CNN
F 1 "switch_bypass" H 3750 1044 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3750 900 50  0001 C CNN
F 3 "~" H 3750 900 50  0001 C CNN
	1    3750 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 900  3250 900 
Wire Wire Line
	3250 900  3250 1350
Connection ~ 3250 1350
Wire Wire Line
	3950 900  4200 900 
Wire Wire Line
	4200 900  4200 1450
Connection ~ 4200 1450
$Comp
L Regulator_Linear:AMS1117-3.3 U2
U 1 1 5CF53AE8
P 9150 1700
F 0 "U2" H 9150 1942 50  0000 C CNN
F 1 "AMS1117-3.3" H 9150 1851 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 9150 1900 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 9250 1450 50  0001 C CNN
	1    9150 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5CF55135
P 9150 2300
F 0 "#PWR0111" H 9150 2050 50  0001 C CNN
F 1 "GND" H 9155 2127 50  0000 C CNN
F 2 "" H 9150 2300 50  0001 C CNN
F 3 "" H 9150 2300 50  0001 C CNN
	1    9150 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 2300 9150 2200
$Comp
L Device:C C1
U 1 1 5CF560D2
P 8500 1850
F 0 "C1" H 8615 1896 50  0000 L CNN
F 1 "0.01uF" H 8615 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8538 1700 50  0001 C CNN
F 3 "~" H 8500 1850 50  0001 C CNN
	1    8500 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8500 2000 8500 2200
Wire Wire Line
	8500 2200 9150 2200
Connection ~ 9150 2200
Wire Wire Line
	9150 2200 9150 2000
$Comp
L Device:C C2
U 1 1 5CF5790E
P 9850 1850
F 0 "C2" H 9965 1896 50  0000 L CNN
F 1 "10uF" H 9965 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 9888 1700 50  0001 C CNN
F 3 "~" H 9850 1850 50  0001 C CNN
	1    9850 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 1700 9450 1700
Wire Wire Line
	9850 2000 9850 2200
Wire Wire Line
	9850 2200 9150 2200
Wire Wire Line
	8850 1700 8500 1700
Connection ~ 8500 1700
Wire Wire Line
	8500 1700 8150 1700
$Comp
L power:+5V #PWR0112
U 1 1 5CF5C78F
P 8150 1700
F 0 "#PWR0112" H 8150 1550 50  0001 C CNN
F 1 "+5V" H 8165 1873 50  0000 C CNN
F 2 "" H 8150 1700 50  0001 C CNN
F 3 "" H 8150 1700 50  0001 C CNN
	1    8150 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5CF5D2D1
P 10350 1850
F 0 "C3" H 10465 1896 50  0000 L CNN
F 1 "0.01uF" H 10465 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 10388 1700 50  0001 C CNN
F 3 "~" H 10350 1850 50  0001 C CNN
	1    10350 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 1700 9850 1700
Connection ~ 9850 1700
Wire Wire Line
	10350 2000 10350 2200
Wire Wire Line
	10350 2200 9850 2200
Connection ~ 9850 2200
Wire Wire Line
	10350 1700 10650 1700
Wire Wire Line
	10650 1700 10650 1500
Connection ~ 10350 1700
Text GLabel 10650 1500 1    50   Output ~ 0
SD_3V3
Wire Wire Line
	9450 4650 8750 4650
Wire Wire Line
	8750 4650 8750 5000
$Comp
L power:GND #PWR0113
U 1 1 5CF63578
P 8750 5000
F 0 "#PWR0113" H 8750 4750 50  0001 C CNN
F 1 "GND" H 8755 4827 50  0000 C CNN
F 2 "" H 8750 5000 50  0001 C CNN
F 3 "" H 8750 5000 50  0001 C CNN
	1    8750 5000
	1    0    0    -1  
$EndComp
Text GLabel 9250 4450 0    50   Input ~ 0
SD_3V3
Wire Wire Line
	1850 2950 1500 2950
Connection ~ 1500 2950
Text GLabel 2850 3750 0    50   Output ~ 0
SD_SS
Text GLabel 6950 3750 0    50   Input ~ 0
SD_SS
$Comp
L 74xx:74LVC125 U1
U 1 1 5CF71ED0
P 8300 5050
F 0 "U1" H 8300 5367 50  0000 C CNN
F 1 "74LVC125" H 8300 5276 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 8300 5050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LVC125" H 8300 5050 50  0001 C CNN
	1    8300 5050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LVC125 U1
U 2 1 5CF77D31
P 8300 4350
F 0 "U1" H 8300 4667 50  0000 C CNN
F 1 "74LVC125" H 8300 4576 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 8300 4350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LVC125" H 8300 4350 50  0001 C CNN
	2    8300 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 4450 9250 4450
Wire Wire Line
	8600 5050 8600 4550
Wire Wire Line
	8600 4350 9450 4350
$Comp
L power:GND #PWR0114
U 1 1 5CFA02EB
P 8300 5300
F 0 "#PWR0114" H 8300 5050 50  0001 C CNN
F 1 "GND" H 8305 5127 50  0000 C CNN
F 2 "" H 8300 5300 50  0001 C CNN
F 3 "" H 8300 5300 50  0001 C CNN
	1    8300 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5CFA184A
P 8300 4600
F 0 "#PWR0115" H 8300 4350 50  0001 C CNN
F 1 "GND" H 8305 4427 50  0000 C CNN
F 2 "" H 8300 4600 50  0001 C CNN
F 3 "" H 8300 4600 50  0001 C CNN
	1    8300 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 5900 9000 4750
Text GLabel 2850 3850 0    50   Output ~ 0
MOSI
Text GLabel 2850 3950 0    50   Input ~ 0
MISO
Text GLabel 2850 4050 0    50   Output ~ 0
SPI_SCK
Text GLabel 6950 4350 0    50   Input ~ 0
MOSI
Text GLabel 6950 5050 0    50   Input ~ 0
SPI_SCK
Text GLabel 6900 5900 0    50   Output ~ 0
MISO
$Comp
L Device:R R3
U 1 1 5CFCF0BB
P 4500 2750
F 0 "R3" H 4570 2796 50  0000 L CNN
F 1 "100k/10k" H 4570 2705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 4430 2750 50  0001 C CNN
F 3 "~" H 4500 2750 50  0001 C CNN
	1    4500 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3550 4250 3550
Wire Wire Line
	4250 3550 4250 2600
Wire Wire Line
	4250 2600 4500 2600
$Comp
L power:GND #PWR0117
U 1 1 5CFD0BC9
P 4500 2900
F 0 "#PWR0117" H 4500 2650 50  0001 C CNN
F 1 "GND" H 4505 2727 50  0000 C CNN
F 2 "" H 4500 2900 50  0001 C CNN
F 3 "" H 4500 2900 50  0001 C CNN
	1    4500 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5CFD0FEC
P 4500 2350
F 0 "R2" H 4570 2396 50  0000 L CNN
F 1 "1M/100k" H 4570 2305 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 4430 2350 50  0001 C CNN
F 3 "~" H 4500 2350 50  0001 C CNN
	1    4500 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2500 4500 2600
Connection ~ 4500 2600
Wire Wire Line
	4500 2200 3950 2200
Wire Wire Line
	3950 2200 3950 1750
Wire Wire Line
	3950 1750 3250 1750
Connection ~ 3250 1750
Wire Wire Line
	3250 1750 3250 2350
$Comp
L Device:R R5
U 1 1 5CFDE4C5
P 7850 4350
F 0 "R5" V 7643 4350 50  0000 C CNN
F 1 "0" V 7734 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7780 4350 50  0001 C CNN
F 3 "~" H 7850 4350 50  0001 C CNN
	1    7850 4350
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5CFE27C1
P 7850 5900
F 0 "R4" V 7643 5900 50  0000 C CNN
F 1 "0" V 7734 5900 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7780 5900 50  0001 C CNN
F 3 "~" H 7850 5900 50  0001 C CNN
	1    7850 5900
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5CFE6122
P 7850 5050
F 0 "R6" V 7643 5050 50  0000 C CNN
F 1 "0" V 7734 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7780 5050 50  0001 C CNN
F 3 "~" H 7850 5050 50  0001 C CNN
	1    7850 5050
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 5CFF109E
P 2150 4650
F 0 "SW2" H 2150 4935 50  0000 C CNN
F 1 "action" H 2150 4844 50  0000 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H13mm" H 2150 4850 50  0001 C CNN
F 3 "~" H 2150 4850 50  0001 C CNN
	1    2150 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5CFF3725
P 1950 4650
F 0 "#PWR0118" H 1950 4400 50  0001 C CNN
F 1 "GND" H 1955 4477 50  0000 C CNN
F 2 "" H 1950 4650 50  0001 C CNN
F 3 "" H 1950 4650 50  0001 C CNN
	1    1950 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5CFFFF88
P 11150 5050
F 0 "#PWR0119" H 11150 4800 50  0001 C CNN
F 1 "GND" H 11155 4877 50  0000 C CNN
F 2 "" H 11150 5050 50  0001 C CNN
F 3 "" H 11150 5050 50  0001 C CNN
	1    11150 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5D007285
P 9100 3900
F 0 "R10" H 9170 3946 50  0000 L CNN
F 1 "47/50k" H 9000 3750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 9030 3900 50  0001 C CNN
F 3 "~" H 9100 3900 50  0001 C CNN
	1    9100 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 3700 9100 3750
Wire Wire Line
	9450 4150 9100 4150
Wire Wire Line
	9100 4150 9100 4050
Wire Wire Line
	9000 4750 9450 4750
Wire Wire Line
	9350 4850 9450 4850
Wire Wire Line
	9350 4850 9350 4050
$Comp
L Device:R R11
U 1 1 5D01722F
P 9350 3900
F 0 "R11" H 9420 3946 50  0000 L CNN
F 1 "47/50k" H 9300 3750 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 9280 3900 50  0001 C CNN
F 3 "~" H 9350 3900 50  0001 C CNN
	1    9350 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9350 3750 9100 3750
Connection ~ 9100 3750
Wire Wire Line
	6950 4350 7150 4350
Wire Wire Line
	7150 4350 7150 3700
Connection ~ 7150 4350
Wire Wire Line
	7150 4350 7700 4350
$Comp
L Device:R R8
U 1 1 5D03025E
P 8650 5750
F 0 "R8" H 8720 5796 50  0000 L CNN
F 1 "47/50k" H 8720 5705 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 8580 5750 50  0001 C CNN
F 3 "~" H 8650 5750 50  0001 C CNN
	1    8650 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5D0338EC
P 7150 3550
F 0 "R7" H 7080 3504 50  0000 R CNN
F 1 "47/70k" H 7080 3595 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7080 3550 50  0001 C CNN
F 3 "~" H 7150 3550 50  0001 C CNN
	1    7150 3550
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR0122
U 1 1 5D03681F
P 7150 3400
F 0 "#PWR0122" H 7150 3250 50  0001 C CNN
F 1 "+5V" H 7165 3573 50  0000 C CNN
F 2 "" H 7150 3400 50  0001 C CNN
F 3 "" H 7150 3400 50  0001 C CNN
	1    7150 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 5050 7400 5050
Wire Wire Line
	9450 4250 8800 4250
Wire Wire Line
	8800 4250 8800 3750
$Comp
L Device:R R9
U 1 1 5D042EFF
P 7650 3550
F 0 "R9" H 7720 3596 50  0000 L CNN
F 1 "47k/50k" H 7720 3505 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7580 3550 50  0001 C CNN
F 3 "~" H 7650 3550 50  0001 C CNN
	1    7650 3550
	1    0    0    -1  
$EndComp
Text Label 3850 3850 0    50   ~ 0
SCL
Text Label 3850 3750 0    50   ~ 0
SDA
Wire Wire Line
	1850 3450 2850 3450
Wire Wire Line
	1850 2950 1850 3450
Wire Wire Line
	2350 3050 2850 3050
Wire Wire Line
	2350 3050 2350 4650
$Comp
L 74xx:74LVC125 U1
U 5 1 5D0BA73C
P 5500 5250
F 0 "U1" H 5730 5296 50  0000 L CNN
F 1 "74LVC125" H 5730 5205 50  0000 L CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 5500 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LVC125" H 5500 5250 50  0001 C CNN
	5    5500 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 5D0BC291
P 5500 5750
F 0 "#PWR0124" H 5500 5500 50  0001 C CNN
F 1 "GND" H 5505 5577 50  0000 C CNN
F 2 "" H 5500 5750 50  0001 C CNN
F 3 "" H 5500 5750 50  0001 C CNN
	1    5500 5750
	1    0    0    -1  
$EndComp
Text GLabel 5500 4650 1    50   Input ~ 0
SD_3V3
Text GLabel 9100 3700 1    50   Input ~ 0
SD_3V3
$Comp
L Connector:Micro_SD_Card_Det J4
U 1 1 5D0EA3EA
P 10350 4550
F 0 "J4" H 10300 5367 50  0000 C CNN
F 1 "Micro_SD_Card_Det" H 10300 5276 50  0000 C CNN
F 2 "parts:SOFNG_TF-15_15" H 12400 5250 50  0001 C CNN
F 3 "https://www.hirose.com/product/en/download_file/key_name/DM3/category/Catalog/doc_file_id/49662/?file_category_id=4&item_id=195&is_series=1" H 10350 4650 50  0001 C CNN
	1    10350 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5D0EB2B3
P 9450 5050
F 0 "#PWR0120" H 9450 4800 50  0001 C CNN
F 1 "GND" H 9455 4877 50  0000 C CNN
F 2 "" H 9450 5050 50  0001 C CNN
F 3 "" H 9450 5050 50  0001 C CNN
	1    9450 5050
	1    0    0    -1  
$EndComp
Text GLabel 9450 4950 0    50   Output ~ 0
SD_DETECT
Text GLabel 2850 3150 0    50   Input ~ 0
SD_DETECT
NoConn ~ 8600 2950
Text GLabel 8650 5600 1    50   Input ~ 0
SD_3V3
Connection ~ 8650 5900
Wire Wire Line
	8650 5900 9000 5900
Text GLabel 8300 2700 1    50   Input ~ 0
SD_3V3
$Comp
L 74xx:74LVC125 U1
U 4 1 5CFD7F50
P 8300 2950
F 0 "U1" H 8300 3175 50  0000 C CNN
F 1 "74LVC125" H 8300 3266 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 8300 2950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LVC125" H 8300 2950 50  0001 C CNN
	4    8300 2950
	1    0    0    1   
$EndComp
Text GLabel 8000 2700 1    50   Input ~ 0
SD_3V3
Wire Wire Line
	8000 2700 8000 2950
$Comp
L Device:C C4
U 1 1 5D00D801
P 5050 5250
F 0 "C4" H 5165 5296 50  0000 L CNN
F 1 "0.1u" H 5165 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5088 5100 50  0001 C CNN
F 3 "~" H 5050 5250 50  0001 C CNN
	1    5050 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5750 5500 5750
Wire Wire Line
	5050 5400 5050 5750
Connection ~ 5500 5750
Wire Wire Line
	5500 4750 5500 4700
Wire Wire Line
	5500 4700 5050 4700
Wire Wire Line
	5050 4700 5050 5100
Connection ~ 5500 4700
Wire Wire Line
	5500 4700 5500 4650
$Comp
L Device:R R13
U 1 1 5D01D61B
P 5200 3300
F 0 "R13" H 5270 3346 50  0000 L CNN
F 1 "2-4k" H 5270 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 5130 3300 50  0001 C CNN
F 3 "~" H 5200 3300 50  0001 C CNN
	1    5200 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5D02BB2E
P 4800 3300
F 0 "R12" H 4870 3346 50  0000 L CNN
F 1 "2-4k" H 4870 3255 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P5.08mm_Horizontal" V 4730 3300 50  0001 C CNN
F 3 "~" H 4800 3300 50  0001 C CNN
	1    4800 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3700 4800 3700
Wire Wire Line
	4550 3800 5200 3800
Wire Wire Line
	5200 3800 5200 3450
Connection ~ 5200 3800
Wire Wire Line
	4800 3450 4800 3700
Connection ~ 4800 3700
$Comp
L power:+5V #PWR0121
U 1 1 5D046242
P 5200 3150
F 0 "#PWR0121" H 5200 3000 50  0001 C CNN
F 1 "+5V" H 5215 3323 50  0000 C CNN
F 2 "" H 5200 3150 50  0001 C CNN
F 3 "" H 5200 3150 50  0001 C CNN
	1    5200 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0123
U 1 1 5D0467C1
P 4800 3150
F 0 "#PWR0123" H 4800 3000 50  0001 C CNN
F 1 "+5V" H 4815 3323 50  0000 C CNN
F 2 "" H 4800 3150 50  0001 C CNN
F 3 "" H 4800 3150 50  0001 C CNN
	1    4800 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3500 5300 3500
Wire Wire Line
	4550 3600 5300 3600
Wire Wire Line
	4800 3700 5300 3700
Wire Wire Line
	5200 3800 5300 3800
$Comp
L Device:R R14
U 1 1 5D05F01A
P 7400 3000
F 0 "R14" H 7470 3046 50  0000 L CNN
F 1 "47k/50k" H 7470 2955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 7330 3000 50  0001 C CNN
F 3 "~" H 7400 3000 50  0001 C CNN
	1    7400 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 4000 1150 4000
Wire Wire Line
	2250 3900 1150 3900
Wire Wire Line
	8000 5900 8650 5900
Wire Wire Line
	6900 5900 7700 5900
$Comp
L 74xx:74LVC125 U1
U 3 1 5D1F27DC
P 8300 3750
F 0 "U1" H 8300 4067 50  0000 C CNN
F 1 "74LVC125" H 8300 3976 50  0000 C CNN
F 2 "" H 8300 3750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LVC125" H 8300 3750 50  0001 C CNN
	3    8300 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 3750 7650 3750
Wire Wire Line
	7650 3700 7650 3750
Wire Wire Line
	8600 3750 8800 3750
Connection ~ 7650 3750
Wire Wire Line
	7650 3750 6950 3750
$Comp
L power:+5V #PWR0116
U 1 1 5D218767
P 7650 3400
F 0 "#PWR0116" H 7650 3250 50  0001 C CNN
F 1 "+5V" H 7665 3573 50  0000 C CNN
F 2 "" H 7650 3400 50  0001 C CNN
F 3 "" H 7650 3400 50  0001 C CNN
	1    7650 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5D219389
P 8300 4000
F 0 "#PWR0125" H 8300 3750 50  0001 C CNN
F 1 "GND" H 8305 3827 50  0000 C CNN
F 2 "" H 8300 4000 50  0001 C CNN
F 3 "" H 8300 4000 50  0001 C CNN
	1    8300 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3150 7400 5050
Connection ~ 7400 5050
Wire Wire Line
	7400 5050 7700 5050
Wire Wire Line
	8600 4550 9450 4550
$Comp
L power:+5V #PWR0126
U 1 1 5D22F323
P 7400 2850
F 0 "#PWR0126" H 7400 2700 50  0001 C CNN
F 1 "+5V" H 7415 3023 50  0000 C CNN
F 2 "" H 7400 2850 50  0001 C CNN
F 3 "" H 7400 2850 50  0001 C CNN
	1    7400 2850
	1    0    0    -1  
$EndComp
Text Label 1300 4000 0    50   ~ 0
ECHO
Text Label 1300 3900 0    50   ~ 0
TRIGGER
Wire Wire Line
	2100 2950 2100 4000
Wire Wire Line
	2100 2950 2850 2950
Wire Wire Line
	2250 3900 2250 3350
Wire Wire Line
	2250 3350 2850 3350
$EndSCHEMATC
