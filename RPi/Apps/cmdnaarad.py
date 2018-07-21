#! /usr/bin/python
import sys
sys.path.insert(0, '../NaaradServer/NewServer');

from mySock import mysocket;
import time;

SERVER="raspberrypi";
PORT=1234;

def main(argv):
        if (len(sys.argv) < 6):
		print "Usage: "+sys.argv[0]+" RFM_SEND NODEID CMD PORTNO TIMEOUT";
        else:
		tt=sys.argv[1];
		for i in range(2,len(sys.argv)):
			tt=tt+" "+sys.argv[i]
		#CMD=sys.argv[1];
		#OP=sys.argv[2];
		#ID=sys.argv[3];
		#PORTNO=sys.argv[4];
		#TIMEOUT=sys.argv[5];
		#FULLCMD=CMD+" "+OP+" "+ID+" "+PORTNO+" "+TIMEOUT;

		FULLCMD=tt;

		print FULLCMD;
		naaradSoc=mysocket();
		naaradSoc.connect(SERVER,PORT);
		naaradSoc.send("open");time.sleep(0.1);
		naaradSoc.send(FULLCMD);#time.sleep(1);
		naaradSoc.send("done");time.sleep(0.1);
		naaradSoc.close();

if __name__ == "__main__":
    main(sys.argv)
