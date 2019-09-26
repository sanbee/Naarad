from __future__ import print_function;
import sys
sys.path.insert(0, '../NewServer');

def init():
    global SERVER, PORT;

    SERVER="localhost";
#    SERVER="naaradhost";
    PORT=1234;

#    print("Connection: SERVER:",SERVER," PORT:",PORT);

init();
