#! /usr/bin/python
import sys
sys.path.insert(0, '../NaaradServer/NewServer');

from mySock import mysocket;
import time;
import socket;
import errno;
from socket import error;

SERVER="raspberrypi";
SERVER="192.168.0.66";
SERVER="localhost";
PORT=1234;


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
        print("poll: Timed out during poll");
        raise;
    except socket.error as e:
        print("poll: SocketError during receive(). "+str(e));
        raise;
    except RuntimeError as e:
        print("poll: RuntimeError during receive(). "+str(e));
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

                poll(soc,NODEID);

                tt=soc.receive();
                soc.send("done");time.sleep(0.1);
                print tt;
            except socket.error as e:
                if (e.errno == errno.ECONNREFUSED):
                    print ("socket: Connection refused");
                else:
                    print("socket: I/O timed out");
                

if __name__ == "__main__":
    main(sys.argv)
