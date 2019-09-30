ATT88 Physical Pin | RFM69CW Pins
-------------------|-------------
16 (SS)                    |   7 (NSS)
17 (MOSI)                  |   8 (MISO)
18 (MISO)                  |   5 (MOSI)
19 (SCK)                   |   6 (SCK)
4 (INT0/2/PCINT18/PD2)    |   9 (DI00)

## Connections:

Arduino UNO Pin labels |  Physical Pin on ATTiny88-PU
-----------------------|------------------------------
10 (SS)           |       1 (RESET)
11 (MOSI)         |      17 (MOSI)
12 (MISO)         |      18 (MISO)
13 (SCK)          |      19 (SCK)
3.3V              |      20 (VACC) and 7 (VCC)
GND               |      22 (GND)

## Procedure:

1. Install ATTinyCore
2. Select  Tools->Board->Arduino/Genuino UNO    (or whatever board you are using)
3. Load ArduinoISP sketch from Files->examples->ArduinoISP
4. Select  Tools->Board->Attiny48/88.  After this, the "Tools" menus should show the following for the board.  Make clock, "B.O.D." and other selections as appropriate:
```
    Board: "ATtiny48/88"
    Chip: ATtiny88
    Clock: "8MHz (internal)"
    Save EEPRO: "EEPROM retained"
    LTO: "Disabled"
    B.O.D. Level: "B.O.D. Disabled"
```
5. Select Tools->Programmer->"Arduino as ISP".  The "Tools" menu should then show the following:
```
    Programmer: "Arduino as ISP"
```
6. Now upload your sketch for ATT88 as usual.
