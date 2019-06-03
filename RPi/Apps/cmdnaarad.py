#! /usr/bin/python
import sys
sys.path.insert(0, '../NaaradServer/NewServer');
import serverinfo

from mySock import mysocket;
import time;

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


class MyException(Exception):
    pass;

def neumonic(cmd):
        if (cmd == "CLOSE"): return 0;
        if (cmd == "OPEN"): return 1;
        if (cmd == "SHUT"): return 2;
        if (cmd == "RX_TO"): return 3;
        if (cmd == "POLL_TO"): return 4;
        if (cmd == "PULSE_WIDTH"): return 5;
        raise MyException("Incorrect command string \""+cmd+"\"");

def main(argv):
        if (len(sys.argv) < 6):
		print "Usage: "+sys.argv[0]+" RFM_SEND NODEID CMD P1 P0\n";
                print helpmsg;
        else:
                try:
		        tt=sys.argv[1];
                        cmd=sys.argv[2];
		        for i in range(2,len(sys.argv)):
                                if ((i==3) and (not sys.argv[i].isdigit())):
                                        cmd = neumonic(sys.argv[3]);
                                        if (cmd >= 0):
                                                tt=tt+" "+str(cmd);
                                else:
			                tt=tt+" "+sys.argv[i]

		        FULLCMD=tt;

		        print FULLCMD;
		        naaradSoc=mysocket();
		        naaradSoc.connect(serverinfo.SERVER,serverinfo.PORT);
		        naaradSoc.send("open");time.sleep(0.1);
		        naaradSoc.send(FULLCMD);#time.sleep(1);
		        naaradSoc.send("done");time.sleep(0.1);
		        naaradSoc.close();
                except MyException as e:
                        print str(e);
if __name__ == "__main__":
    main(sys.argv)
