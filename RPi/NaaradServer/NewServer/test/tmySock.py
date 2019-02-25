#! /usr/bin/python
import sys
sys.path.insert(0, '..');
from mySock import *;

def start(argv):
    mysock = mysocket();
    mysock.connect("localhost", 1234);
    #msg="notify 16 00 ACKpkt: 120";

    msg="17 SensorDataSync11 gethpkt 1";
    msg="00125 {\"node_v\": 2.44, \"node_p\": -45, \"rf_fail\": 0, \"source\": \"RS0\", \"node_id\": 1, \"time\": 1551065118100.7131, \"degc\": 18.22}"
#    msg="00020 SensorDataSync00014 gethpkt 1";
    mysock.send_tst(msg);

    # msg = argv[1];
    # mysock.send(msg);
    mysock.close();
# #    msg="{\"node\": 16, \"p0\": 0, \"p1\": 16, \"cmd\": 255, \"rf_fail\": 1, \"source\": \"ACKpkt:\", \"time\": 1550121563889.79}"


start(sys.argv);
