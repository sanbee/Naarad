#! /usr/bin/python
import sys;
sys.path.insert(0, '/export/home/langur/sbhatnag/Projects/GitHub/Naarad/RPi/NaaradServer/NewServer');
sys.path.insert(1, '/export/home/langur/sbhatnag/Projects/GitHub/Naarad/RPi/Apps');
import cmdnaarad
import notify
import time;

def tt():
    # Set ping timeout to 10 sec
    cmdnaarad.cmdnaarad(str.split("cmdnaarad RFM_SEND 16 4 10 1"));
    time.sleep(0.1);
    # Wait for timeout commond to be executed
    notify.notify(str.split("notify notify 16 4 ACKpkt: 120 2"));
    # Wait for a NoOp to be exectued
    # notify.notify("notify notify 16 255 ACKpkt: 120 2");
    time.sleep(0.1);


    # Open the valve
    cmdnaarad.cmdnaarad(str.split("cmdnaarad RFM_SEND 16 1 0 0"));
    # Wait for a NoOp to be exectued
    notify.notify(str.split("notify notify 16 1 ACKpkt: 120 2"));
    time.sleep(60);

    # Close the valve
    cmdnaarad.cmdnaarad(str.split("cmdnaarad RFM_SEND 16 0 0 0"));
    time.sleep(0.1);
    # Set ping timeout to 60 sec
    cmdnaarad.cmdnaarad(str.split("cmdnaarad RFM_SEND 16 4 60 0"));
