#! /usr/bin/python
import sys
sys.path.insert(0, '../NaaradServer/NewServer');

from mySock import mysocket;
import time;

SERVER="raspberrypi";
SERVER="192.168.0.66";
PORT=1234;
helpmsg="\n\
   Operation       NODEID    CMD       P1                 P0\n\
  --------------------------------------------------------------------------------\n\
   VALVE CLOSE       N        0       PORT          TIMEOUT in minutes (default 30min)\n\
  \n\
   VALVE OPEN        N        1       PORT          TIMEOUT in minutes (default 30min)\n\
  \n\
   VALVE SHUT        N        2       PORT          N/A\n\
  \n\
   Set RX TO         N        3        N/A          TIMEOUT in  sec. (default 3sec)\n\
  \n\
   Set TX interval   N        4     TO in sec.      Multiplier (default 1)\n\
                                    (default 60s)\n\
  \n\
   Set valve pulse   N        5     Multiplier      Pulse width in milli sec.\n\
   width                                            (default 10ms)\n\
  \n\
   NOOP              N       255       N/A          N/A"


def neumonic(cmd):
        if (cmd == "CLOSE"): return 0;
        if (cmd == "OPEN"): return 1;
        if (cmd == "SHUT"): return 2;
        if (cmd == "RX_TO"): return 3;
        if (cmd == "POLL_TO"): return 4;
        if (cmd == "PULSE_WIDTH"): return 5;

def main(argv):
        if (len(sys.argv) < 6):
		print "Usage: "+sys.argv[0]+" RFM_SEND NODEID CMD P1 P0\n";
                print helpmsg;
        else:
		tt=sys.argv[1];
		for i in range(2,len(sys.argv)):
			tt=tt+" "+sys.argv[i]
		#CMD=sys.argv[1];
		#OP=sys.argv[2];
		#ID=sys.argv[3];
		#PORTNO=sys.argv[4];
		#TIMEOUT=sys.argv[5];
		#FULLCMD=CMD+" "+OP+" "+ID+" "+PORTNO+" "+TIMEOUT;

		FULLCMD=tt;

		print FULLCMD;
		naaradSoc=mysocket();
		naaradSoc.connect(SERVER,PORT);
		naaradSoc.send("open");time.sleep(0.1);
		naaradSoc.send(FULLCMD);#time.sleep(1);
		naaradSoc.send("done");time.sleep(0.1);
		naaradSoc.close();

if __name__ == "__main__":
    main(sys.argv)
