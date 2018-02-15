# import socket;
# from socket import error as SocketError
# import errno
from mySock import mysocket;
import time;
import sys

SERVER="raspberrypi";
PORT=1234;

def main(argv):
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
