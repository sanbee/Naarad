#! /usr/bin/python
import sys
sys.path.insert(0, '../NaaradServer/NewServer');

from mySock import mysocket;
import time;

SERVER="raspberrypi";
PORT=1234;

def main(argv):
    if (len(sys.argv) < 3):
	print("Usage: "+sys.argv[0]+" LAMP 0|1");
    else:
    	LAMP=sys.argv[1];
    	OP=sys.argv[2];
    	CMD="tell "+LAMP+" "+OP;

    	naaradSoc=mysocket();
    	naaradSoc.connect(SERVER,PORT);
    	naaradSoc.send("open");time.sleep(1);
    	naaradSoc.send(CMD);time.sleep(1);
    	naaradSoc.send("done");time.sleep(1);
    	naaradSoc.close();

if __name__ == "__main__":
    main(sys.argv)
