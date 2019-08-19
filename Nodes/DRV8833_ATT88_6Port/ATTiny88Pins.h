//
// Apparently, the #defines in IDE like PD5, have nothing to do with the actual pin
// number to use.  The "pin numbers" on data sheets are called PDx, PBx etc.  The 'D' and
// 'B' in those do represent the port bit number.  E.g. PD5 corresponds to the bit 5 in
// PORTD variable.
//
// The IDE has #defined like PDx, which refers to Dx in pinout diagrams as "arduino
// labels".  However all online resources say that one should use just the integer x and
// NOT PD5 or D5 in the code!!  The 'D' in the case just represents that the pin is
// "digital".  Why are these defined in the first place in Arduino IDE framework in a
// file included (automatically!) in application layer software?
//
// And none of the above has anything do with the physical pin numbers.  E.g. Physical
// pin 9 on Attiny88-PU has designation PB6 in data sheets.  It is called "D14" in Arduino
// IDE.  However pinMode() should get integer 14.
//
// So much for the folk-lore that "...hardware engineering is better organized than
// software engineering".
//
#define PIN_PD0  0
#define PIN_PD1  1
#define PIN_PD2  2
#define PIN_PD3  3
#define PIN_PD4  4
#define PIN_PD5  5
#define PIN_PD6  6
#define PIN_PD7  7
#define PIN_PB0  8
#define PIN_PB1  9
#define PIN_PB2  10
#define PIN_PB3  11
#define PIN_PB4  12
#define PIN_PB5  13
#define PIN_PB6  14

#define PIN_PC0  17 /* Also A0 */
#define PIN_PC1  18 /* Also A1 */
#define PIN_PC2  19 /* Also A2 */
#define PIN_PC3  20 /* Also A3 */
#define PIN_PC4  21 /* Also A4 */
#define PIN_PC5  22 /* Also A5 */
#define PIN_PC6  27 
#define PIN_PC7  16


