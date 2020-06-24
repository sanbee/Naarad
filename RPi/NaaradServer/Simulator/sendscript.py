#! /usr/bin/python
import sys;
sys.path.insert(0, '../NewServer');
import serverinfo;

from mySock import mysocket;
import sys
import time;

def sendscript(argv):
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
     print xx;
     sendscript(xx);
