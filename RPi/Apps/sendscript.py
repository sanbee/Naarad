#! /usr/bin/python3
import sys;
#sys.path.insert(0, '../NewServer');
import serverinfo;

from mySock import mysocket;
import sys
import time;

def sendscript(argv):
    """This script takes a valid Naarad Python script and sends it to the
    Naarad server for execution.  The script can have Naarad commands
    as arguments to "self.messageHandler()".  E.g.

      self.messageHandler("RFM_SEND "+str(node)+" 4 10 1"); # Set ping timeout to 10 sec

    This mechanism is typically used for naarad devices where a
    sequence of commands are required with delays in between the
    commands.  An example of this is in the script named
    "sc6_watering.py".  This script has a number of commands to start
    a particular sprinker circuit and issue the sequence of commands
    required to stop the circuit after a specified delay.
    """
    if (len(argv) < 2):
        print("Usage: cmd");
    else:
    	CMD=argv[1];
                
    	naaradSoc=mysocket();
    	naaradSoc.connect(serverinfo.SERVER,serverinfo.PORT);
    	naaradSoc.send("sendscript App");
    	naaradSoc.send(CMD);time.sleep(0.1);
    	naaradSoc.send("done");
    	naaradSoc.close();

if __name__ == "__main__":
     tt=open(sys.argv[1]).read();
     xx=[];
     xx.append("sendscript");
     xx.append("runscript "+tt);
     #xx.append(tt);
     print(xx);
     sendscript(xx);
