#include <iostream>
#include <stdio.h>
#include "RemoteCmd.h"
typedef char byte;
#define MASK_PORTA 0b10001111 //Only bits with 1 will be modified
#define MASK_PORTB 0b00000001 //Only bits with 1 will be modified
#define N_PORTS 5
#define HIGH 1
#define LOW 0
#define SETBIT(t,n)  (t |= 1<<n)
#define CLRBIT(t,n)  (t &= ~(1 << n))
static const byte port2BitMap[N_PORTS]={0,1,2,3,7}; //Pins: A0, A1,A2,A3,A7
#define getPORTA() (0b10001111)
#define getPORTB() (0b00000001)

static byte PORTA, PORTB;
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
//value = (value & ~mask) | (newvalue & mask);

void setPortA(byte& port,const byte& val)
{
  port = (port & ~MASK_PORTA) | (val & MASK_PORTA);
}

void setPortB(byte& port,const byte& val)
{
  port = (port & ~MASK_PORTB) | (val & MASK_PORTB);
}

void cmdPort(const byte& cmd, const byte& port)
{
  byte CommonPin, Pin1;
  // portA and portB values should be set to whatever is the current
  // value of PORTA and PORTB registers.
  byte portA=getPORTA(), portB=getPORTB();
  // If CommonPin is 1, B0 and A0-3,A7 should be set to 1. Since the
  // bits that can change in PORTA and PORTB is controlled by
  // MASK_PORTA and MASK_PORTB, setting CommonPin=0b11111111 and then
  // blindly using it to set the bits in PORTA and PORTB will work.
  if      (cmd == OPEN)  {CommonPin=0xFF; Pin1=0;}
  else if (cmd == CLOSE) {CommonPin=0;  Pin1=1;} 
  else                   {CommonPin = Pin1 = 0;}

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
}

int main(int argc, char **argv)
{
  while(1)
    {
      int port, cmd;
      std::cin >> port >> cmd;
      cmdPort(cmd,port);
      printf("B: "); showbits(PORTB);
      printf("A: "); showbits(PORTA);
      cmdPort(SHUT,port);
      printf("B: "); showbits(PORTB);
      printf("A: "); showbits(PORTA);
      printf("------------------------\n");
    }
}
