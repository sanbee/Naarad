#! /usr/bin/python
import sys
sys.path.insert(0, '../NaaradServer/NewServer');

from mySock import mysocket;
import time;
import socket;
import errno;
from socket import error;

SERVER="raspberrypi";
SERVER="localhost";
PORT=


def poll(nsoc, nodeid,polltimeout=10.0):
    CMD = "getcack "+str(nodeid);
    try:
        msg="";
        nsoc.send(CMD);
        currentTimeout=nsoc.getSock().gettimeout();
        nsoc.getSock().settimeout(polltimeout);
        msg = nsoc.receive();
        nsoc.getSock().settimeout(currentTimeout);
    except socket.timeout as e:
#        print("poll: Timed out during poll"+str(e));
        raise;
    except socket.error as e:
#        print("poll: SocketError during receive(). "+str(e));
        raise;
    except RuntimeError as e:
#        print("poll: RuntimeError during receive(). "+str(e));
        raise;
    return msg;


def main(argv):
        if (len(sys.argv) < 2):
		print "Usage: "+sys.argv[0]+" NODEID";
        else:
            NODEID=sys.argv[1];
            try:
                soc=mysocket();
                soc.getSock().settimeout(1.0);
                soc.connect(SERVER,PORT);
                soc.send("open");time.sleep(0.1);

                for i in range(10):
                    try:
                        mesg="";
                        poll(soc,NODEID,1);
                        mesg=soc.receive();
                        soc.send("done");time.sleep(0.1);
                        print mesg;
                        break;
                    except socket.timeout as tt:
                        print("Attempt "+str(i)+" "+str(tt));
            except socket.error as e:
                if (e.errno == errno.ECONNREFUSED):
                    print ("socket: Connection refused");
                else:
                    print("socket: I/O timed out");
                

if __name__ == "__main__":
    main(sys.argv)
