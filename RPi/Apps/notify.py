#! /usr/bin/python
import sys
sys.path.insert(0, '../NaaradServer/NewServer');

from mySock import mysocket;
import time;

SERVER="raspberrypi";
SERVER="192.168.0.66";
PORT=1234;

class MyException(Exception):
    pass;


def main(argv):
        if (len(sys.argv) < 5):
		print "Usage: "+sys.argv[0]+" notify NODEID CMD SOURCE\n";
        else:
                try:
		        naaradcmd=sys.argv[1];
                        nodeid=sys.argv[2]
                        cmd=sys.argv[3];
                        src=sys.argv[4];
		        for i in range(2,len(sys.argv)):
                            naaradcmd=naaradcmd+" "+sys.argv[i]

		        FULLCMD=naaradcmd;

		        print FULLCMD;
		        naaradSoc=mysocket();
		        naaradSoc.connect(SERVER,PORT);
		        naaradSoc.send("open");time.sleep(0.1);
		        naaradSoc.send(FULLCMD);time.sleep(0.1);
                        tt=naaradSoc.receive();
			print tt;
		        naaradSoc.send("done");time.sleep(0.1);
		        naaradSoc.close();
                except MyException as e:
                        print str(e);
if __name__ == "__main__":
    main(sys.argv)
