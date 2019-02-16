#! /usr/bin/python
import sys
sys.path.insert(0, '..');
from mySock import *;

def start():
    mysock = mysocket();
    mysock.connect("localhost", 1234);
    msg="notify 16 0 ACKpkt: 120";
#    msg="{\"node\": 16, \"p0\": 0, \"p1\": 16, \"cmd\": 255, \"rf_fail\": 1, \"source\": \"ACKpkt:\", \"time\": 1550121563889.79}"
    mysock.send(msg);
    mysock.close();

start();
