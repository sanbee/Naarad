#! /usr/bin/python
import serverinfo;

from mySock import mysocket;
import sys
import time;

def isYes(str):
    print(str);
    return (raw_input()=="yes");

def main(argv):
    narg = len(sys.argv);
    if (narg < 2):
	print("Usage: cmd [SERVER-IP] [SERVER-PORT]");
    else:
    	CMD=sys.argv[1];
	SERVER_IP=serverinfo.SERVER;
	SERVER_PORT=serverinfo.PORT;
        if (narg > 2):
		SERVER_IP = sys.argv[2];
	if (narg > 3):
		SERVER_PORT = sys.argv[3];

        if (CMD=="shutdown"):
            if (not isYes("shutdown server at "+str(SERVER_IP)+":"+str(SERVER_PORT)+"." + " Are you sure?")):
                return;
                
    	naaradSoc=mysocket();
    	naaradSoc.connect(SERVER_IP,SERVER_PORT);
    	naaradSoc.send("sendcmd App");
    	naaradSoc.send(CMD);time.sleep(0.1);
    	naaradSoc.send("done");
    	naaradSoc.close();

if __name__ == "__main__":
    main(sys.argv)
