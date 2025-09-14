from __future__ import print_function;
import sys
sys.path.insert(0, '../NaaradServer/NewServer');

def init():
    global SERVER, PORT;

    SERVER="localhost";
#    SERVER="192.168.0.126";
#    SERVER="naaradhost.local";
#    SERVER="192.168.0.95";
    PORT=1234;

#    print("Connection: SERVER:",SERVER," PORT:",PORT);

init();
