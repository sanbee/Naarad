## Connections between ATT88 and RFM69CW

ATT88 Physical Pin | RFM69CW Pins
-------------------|-------------
16 (SS)                    |   7 (NSS)
18 (MISO)                  |   8 (MISO)
17 (MOSI)                  |   5 (MOSI)
19 (SCK)                   |   6 (SCK)
4 (INT0/2/PCINT18/PD2)    |   9 (DI00)

## Programming ATT88 from Arduino:

### Connections:
Arduino UNO Pin labels |  Physical Pin on ATTiny88-PU
-----------------------|------------------------------
10 (SS)           |       1 (RESET)
11 (MOSI)         |      17 (MOSI)
12 (MISO)         |      18 (MISO)
13 (SCK)          |      19 (SCK)
3.3V              |      20 (VACC) and 7 (VCC)
GND               |      22 (GND)

Pin 16 of ATT88 is SS. RFM69 pin 7 is also connected to this pin.
When programming the ATT88 from UNO, SS is pulled high to select the
SPI device connected on this pin.  Since both RFM69's SS is also
connected to this pin, when pulled high, both SPI devices (ATT88 and
RFM69) will get selected.  This is not allowed on SPI and therefore
ATT88 cannot be programmed.

Solution is to disconnect RFM69 pin 7 and pull it high.  This can be
done by connect RFM69 pin 7 to VCC for programming the ATT88 and then
connecting it back to ATT88 pin 16.

### Procedure:
0. Disconnect RFM69 pin 7 from ATT88 pin 16 and pull it high
1. [Install ATTinyCore](https://github.com/SpenceKonde/ATTinyCore/blob/master/Installation.md)
2. Select  Tools->Board->Arduino/Genuino UNO    (or whatever board you are using)
3. Load ArduinoISP sketch from Files->examples->ArduinoISP
4. Select  Tools->Board->Attiny48/88.  After this, the "Tools" menus should show the following for the board.  Make clock, "B.O.D." and other selections as appropriate.  
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

ATT88 can operate at 1MHz and 8MHz with internal clock.  

Operating voltage 
   * 0-4MHz: 1.8--5.5V.
   * 4-8MHz: 2.7--5.5V.   

Power Consumption
   * Active Mode: 1 MHz, 1.8V: 240 μA
   * Power-Down Mode: 0.1 μA at 1.8V

### Procedure to configure ATT88 for 4MHz clock using ATtinyCore:

 The original instructions about the procedure using Arudino IDE are at
 https://forum.arduino.cc/index.php?topic=624890.msg4233505#msg4233505

1. Add to (your documents folder)/hardware/ATTinyCore/avr/boards.txt the follwing lines in the attinyx8 section:
```
       attinyx8.menu.clock.4internal=4 MHz (must set CLKPR in sketch)
       attinyx8.menu.clock.4internal.bootloader.low_fuses=0x62
       attinyx8.menu.clock.4internal.build.f_cpu=4000000L
       attinyx8.menu.clock.4internal.bootloader.file=empty/empty_all.hex
```
2. At the top of your setup(), add the following 4 lines of code:
```
       cli(); //disable interrupts - this is a timed sequence.
       CLKPR=0x80; //change enable
       CLKPR=0x01; //set prescaler to 2
       sei(); //enable interrupts
```
3. Restart IDE.  Select "```4 MHz (must set CLKPR in sketch)```" in the clock setting menu.  Upload
the boatloader and then your sketch with this setting.
