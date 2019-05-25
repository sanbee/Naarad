#! /usr/bin/python
import serverinfo;
import sys;
from mySock import mysocket;
import time;

def gethpkt(server,port, nodeid):
    soc=mysocket();
    soc.connect(server,port);
    soc.send("open");time.sleep(0.1);
    for i in range(len(nodeid)):
        CMD="gethpkt "+str(nodeid[i]);		
        soc.send(CMD); time.sleep(0.1);
        tt='';
        while(tt != "PHINISHED"):
            val=soc.receive();
            print val;
            tt=val.split()[0];

    soc.send("done");time.sleep(0.1);
    

def main(argv):
    if (len(sys.argv) < 2):
    	print "Usage: "+sys.argv[0]+" NODEID0 [NODEID1...]";
    else:
        n = len(argv);
        gethpkt(serverinfo.SERVER, serverinfo.PORT, sys.argv[1:n]);

if __name__ == "__main__":
    main(sys.argv)
