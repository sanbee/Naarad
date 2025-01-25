#! /usr/bin/python
import sys;
sys.path.insert(0, '../NewServer');
import serverinfo;

from mySock import mysocket;
import sys
import time;

def isYes(str):
    print(str);
    return (raw_input()=="yes");

def sendcmd(argv):
    if (len(argv) < 2):
	print("Usage: cmd");
    else:
    	CMD=argv[1];
        if (CMD=="shutdown"):
            if (not isYes("shutdown server at "+serverinfo.SERVER+"."+" Are you sure?")):
                return;
                
    	naaradSoc=mysocket();
    	naaradSoc.connect(serverinfo.SERVER,serverinfo.PORT);
    	naaradSoc.send("sendcmd App");
    	naaradSoc.send(CMD);time.sleep(0.1);
    	naaradSoc.send("done");
    	naaradSoc.close();

if __name__ == "__main__":
    sendcmd(sys.argv)
