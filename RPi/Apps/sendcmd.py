#! /usr/bin/python
import serverinfo;

from mySock import mysocket;
import sys
import time;

def main(argv):
    if (len(sys.argv) < 2):
	print("Usage: cmd");
    else:
    	CMD=sys.argv[1];

    	naaradSoc=mysocket();
    	naaradSoc.connect(serverinfo.SERVER,serverinfo.PORT);
    	naaradSoc.send("open");time.sleep(0.1);
    	naaradSoc.send(CMD);time.sleep(0.1);
    	naaradSoc.send("done");time.sleep(0.1);
    	naaradSoc.close();

if __name__ == "__main__":
    main(sys.argv)
