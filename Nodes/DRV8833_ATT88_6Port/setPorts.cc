#include <iostream>
#include <stdio.h>
#include "RemoteCmd.h"
typedef char byte;
#define MASK_PORTA 0b10001111 //Only bits with 1 will be modified
#define MASK_PORTB 0b00000001 //Only bits with 1 will be modified

#define N_PORTS 5
#define SETBIT(t,n)  (t |= 1<<n)
#define CLRBIT(t,n)  (t &= ~(1 << n))
static const byte port2BitMap[N_PORTS]={0,1,2,3,7}; //Pins: A0, A1,A2,A3,A7
#define getPORTA() (0b10001111)
#define getPORTB() (0b01111111)
#define getPORTD() (0b00100000)

#define CMDPORT(c,p) ({setSolenoid(c,p);printf("Insert 10ms delay\n");setSolenoid(SHUT,p);})

// These can go when this code is used in a ATT84 sketch.
#define HIGH 1
#define LOW 0

static byte PORTA, PORTB, PORTD;
using namespace std;
void showbits(byte x)
{
    int i; 
    for(i=(sizeof(x)*8)-1; i>=0; i--)
      {
	(x&(1u<<i))?putchar('1'):putchar('0');
	if (i%4==0) putchar(' ');
      }
    
    printf("\n");
}

void setPortA(byte& port,const byte& val)
{
  port = (port & ~MASK_PORTA) | (val & MASK_PORTA);
}

void setPortB(byte& port,const byte& val)
{
  port = (port & ~MASK_PORTB) | (val & MASK_PORTB);
}

// The following sets the PORTA and PORTB to command the given port
// and SHUT all other ports. In the end, it SHUTs all ports after a
// 10ms delay.  Since it leaves all ports in SHUT state and setPortA()
// and setPortB() will only change the bits allowed by the respective
// masks, it may be OK to directly set the PORTA and PORTB registers
// in this function.  That will save two bytes on the
// stack and elimiate some code. RE-EVALUATE THIS.
void setSolenoid(const byte& cmd, const byte& port)
{
  byte CommonPin=0, Pin1=0;
  // portA and portB values should be set to whatever is the current
  // value of PORTA and PORTB registers.
  byte portA=getPORTA(), portB=getPORTB();
  // If CommonPin is 1, B0 and A0-3,A7 should be set to 1. Since the
  // bits that can change in PORTA and PORTB is controlled by
  // MASK_PORTA and MASK_PORTB, setting CommonPin=0b11111111 and then
  // blindly using it to set the bits in PORTA and PORTB will work.
  if      (cmd == OPEN)  {CommonPin=0xFF; Pin1=0;}
  else if (cmd == CLOSE) {CommonPin=0;  Pin1=1;} 

  printf("P, S, C: %d %d %d\n",port2BitMap[port], (CommonPin==-1)?1:0, Pin1);

  // Set both pins of all ports to the same value as the CommonPin
  // value, effectively issuing the SHUT command to all ports.  No
  // current should be drawn from the battery by any of the ports in
  // this state
  setPortB(portB, CommonPin);
  setPortA(portA, CommonPin);

  // Now set the other pin of the specific port.  port2BitMap maps the
  // port number to the bits in the PORTA.
  if (Pin1==1) SETBIT(portA,port2BitMap[port]);
  else         CLRBIT(portA,port2BitMap[port]);
    
  // Finally, copy the pin settings to PORTA and PORTB registers.  The
  // lines below actually sets the hardware.
  PORTA=portA;
  PORTB=portB;
  printf("B: "); showbits(PORTB);
  printf("A: "); showbits(PORTA);
  printf("Insert 10ms delay\n");
  setPortA(PORTA,0x00);
  CLRBIT(PORTB, 0);//setPortB(PORTB,0x00);
  printf("B: "); showbits(PORTB);
  printf("A: "); showbits(PORTA);
}

//                                       D7              B0             D3             D4            D0              D1
static byte DRV_PIN2_MASK[]={0b00000001, 0b10000000, 0b00010000, 0b00001000, 0b10000000, 0b01000000};
#define PORTD_MASK 0b11011011 
#define PORTB_MASK 0b10000000
#define SLP_MASK   0b00000100
#define HIGH_L     0b11111111
#define LOW_L      0b00000000

void setPort(byte& port,const byte& val, const byte& mask)
{port = (port & ~mask) | (val & mask);}

void setSolenoidPort(const byte& cmd, const byte& cPort)
{
  byte IN1, IN2, portD_l=getPORTD(), portB_l=getPORTB();
  if      (cmd==OPEN)  {IN1=HIGH_L; IN2=LOW_L;} // HIGH, LOW
  else if (cmd==CLOSE) {IN1=LOW_L; IN2=HIGH_L;} // LOW, HIGH
  else /*SHUT*/          {IN1=LOW_L; IN2=LOW_L;} // LOW, LOW

  // Set both DRV pins of all ports to the same value (IN1)
  // Set all DRV IN{A,B}2 pins to same value (IN1).  PD6 is the IN{A,B}1 pin for all DRV ports
  setPort(portD_l, IN1, PORTD_MASK); // PD{0,1,3,4,6,7}=IN1
  setPort(portB_l, IN1, PORTB_MASK); // PB0=IN1;  IB2_0
  
  // Set DRV SLP to HIGH
  setPort(portD_l,   HIGH_L, SLP_MASK); // PD5/SLP_D=HIGH
  //  delay(5);
  
  if (cPort==1) setPort(portB_l, IN2, DRV_PIN2_MASK[cPort]);
  else          setPort(portD_l, IN2, DRV_PIN2_MASK[cPort]);

  printf("   01?3 4S67\n");
  printf("   |||| ||||\n");
  printf("B: "); showbits(portB_l);
  printf("D: "); showbits(portD_l);
  PORTD=portD_l;
  PORTB=portB_l;

  //  delay(20);

  // After 20msec, set all DRV port pins and SLP pin to LOW
  setPort(portD_l, LOW_L, PORTD_MASK);
  setPort(portD_l, LOW_L, SLP_MASK); // PD5/SLP_D=LOW
  setPort(portB_l, LOW_L, PORTB_MASK);

  printf("delay 20ms\n");
  printf("B: "); showbits(portB_l);
  printf("D: "); showbits(portD_l);

  PORTD=portD_l;
  PORTB=portB_l;
  //delay(10);
}

int main(int argc, char **argv)
{
  while(1)
    {
      cout <<  "      0          1           2          3           4          5" << endl;
      cout <<  "A0:[D6,D7] B0:[D6,B0]  A1:[D6,D3] B1:[D6,D4]  A2:[D6,D0] B2:[D6,D1]" << endl;
      int port, cmd;
      std::cin >> port >> cmd;
      cerr << "Port:" << port << " cmd:" << cmd << endl;
      //CMDPORT(cmd,port);
      // setSolenoid(cmd,port);

      setSolenoidPort(cmd,port);
      printf("------------------------\n");
    }
}
