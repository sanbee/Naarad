#! /usr/bin/python
import serverinfo;

import sys
from mySock import mysocket;
import time;

def main(argv):
    if (len(sys.argv) < 3):
	print("Usage: "+sys.argv[0]+" LAMP 0|1");
    else:
    	LAMP=sys.argv[1];
    	OP=sys.argv[2];
    	CMD="tell "+LAMP+" "+OP;

    	naaradSoc=mysocket();
    	naaradSoc.connect(serverinfo.SERVER, serverinfo.PORT);
    	naaradSoc.send("lightOn App");time.sleep(0.1);
    	naaradSoc.send(CMD);time.sleep(0.1);
    	naaradSoc.send("done");time.sleep(0.1);
    	naaradSoc.close();

if __name__ == "__main__":
    main(sys.argv)
