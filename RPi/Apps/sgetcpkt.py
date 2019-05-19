#! /usr/bin/python
import sys
sys.path.insert(0, '../NaaradServer/NewServer');

from mySock import mysocket;
import time;

SERVER="localhost";
PORT=1234;


def main(argv):
        if (len(sys.argv) < 2):
		print "Usage: "+sys.argv[0]+" NODEID";
        else:
            CMD="getcpkt "+str(sys.argv[1]);		
            soc=mysocket();
            soc.connect(SERVER,PORT);
            soc.send("open");time.sleep(0.1);
            soc.send(CMD); time.sleep(0.1);
            tt=soc.receive();
            soc.send("done");time.sleep(0.1);
            print tt;


if __name__ == "__main__":
    main(sys.argv)
