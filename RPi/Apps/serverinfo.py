from __future__ import print_function;
import sys
sys.path.insert(0, '../NaaradServer/NewServer');

def init():
    global SERVER, PORT;

    SERVER="localhost";
    SERVER="naaradhost";
    SERVER="192.168.0.126";
    PORT=1234;

#    print("Connection: SERVER:",SERVER," PORT:",PORT);

init();
