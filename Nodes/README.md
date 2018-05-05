
  * TinyTX: Code that runs on Tx-only remote monitor nodes
  * TinyL9110S: Code for the Sprinkler controller node.  This node
    does full duplex communication and uses the L9110S H-bridge to
    control a DC latching solenoid valve.

- From <ROOT>/
// ATMEL ATTINY84 / ARDUINO
//
//                           +-\/-+
//                     VCC  1|    |14  GND
//             (D  0)  PB0  2|    |13  PA0  (D 10)        AREF
//             (D  1)  PB1  3|    |12  PA1  (D  9) 
//             (D 11)  PB3  4|    |11  PA2  (D  8) 
//  PWM  INT0  (D  2)  PB2  5|    |10  PA3  (D  7) 
//  PWM        (D  3)  PA7  6|    |9   PA4  (D  6) 
//  PWM        (D  4)  PA6  7|    |8   PA5  (D  5)        PWM
//                           +----+