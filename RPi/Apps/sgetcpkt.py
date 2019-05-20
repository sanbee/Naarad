#! /usr/bin/python
import sys
sys.path.insert(0, '../NaaradServer/NewServer');

from mySock import mysocket;
import time;

SERVER="localhost";
PORT=1234;

def getcpkt(server,port, nodeid):
    CMD="getcpkt "+str(nodeid);		
    soc=mysocket();
    soc.connect(server,port);
    soc.send("open");time.sleep(0.1);
    soc.send(CMD); time.sleep(0.1);
    tt=soc.receive();
    soc.send("done");time.sleep(0.1);
    return tt;
    

def main(argv):
        if (len(sys.argv) < 2):
		print "Usage: "+sys.argv[0]+" NODEID";
        else:
            tt=getcpkt(SERVER, PORT, sys.argv[1]);
            print tt;

if __name__ == "__main__":
    main(sys.argv)
