#! /usr/bin/python
import serverinfo;

from mySock import mysocket;
import sys
import time;

def isYes(str):
    print(str);
    return (raw_input()=="yes");

def main(argv):
    if (len(sys.argv) < 2):
	print("Usage: cmd");
    else:
    	FILENAME=sys.argv[1];
        fd=file(FILENAME);
        #script=list(filter(None,fd.read().split('\n')));
        script="BEGINSCRIPT "+fd.read()+" ENDSCRIPT";
        
    	naaradSoc=mysocket();
    	naaradSoc.connect(serverinfo.SERVER,serverinfo.PORT);
    	naaradSoc.send("sendcmd App");
     	naaradSoc.send(script);time.sleep(0.1);
    	naaradSoc.send("done");
    	naaradSoc.close();

if __name__ == "__main__":
    main(sys.argv)
