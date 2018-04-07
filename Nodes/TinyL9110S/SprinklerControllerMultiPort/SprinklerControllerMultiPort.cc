#include <stdio.h>
#include "RemoteCmd.h"
#define NPORTS 5

#define SOLINOID_COMMON PIN_A10 //D0
#define SOLINOID_PORT1 PIN_A7 //D3
#define SOLINOID_PORT2 PIN_A3 //D7
#define SOLINOID_PORT3 PIN_A2 //D8
#define SOLINOID_PORT4 PIN_A1 //D9
#define SOLINOID_PORT5 PIN_A0 //D10

static byte CtrlLines[NPORTS]={SOLINOID_PORT1, SOLINOID_PORT2, SOLINOID_PORT3, SOLINOID_PORT4, SOLINOID_PORT5};

void setPort(const byte& port, const byte& cmd)
{
  byte ctl=LOW,common=LOW;
  if (cmd==OPEN)        {common=HIGH; ctl=LOW;}
  else if (Cmd==CLOSE)  {common=LOW;  ctl=HIGH;}
  else                  {common=LOW;  ctl=LOW;}

  digitalWrite(SOLINOID_COMMON, common);
  for(int i=0;i<NPORTS;i++) digitalWrite(CtrlLines[i], common);

  digitalWrite(CtrlLines[port], ctrl): 
}
