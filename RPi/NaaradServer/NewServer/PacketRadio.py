#! /usr/bin/python

import time;
import sys;

class PacketRadio:
    '''
    Interface to the packet radio.  The communication is via the
    supplied serial port.
    '''

    def __init__(self,comport):
        #self.com1=comPort();
        self.com1=comport;
        # self.com1.open();
        self.serial = self.com1.getSerial();
        self.tau=2.0;
        self.pktNo=0;

    def getPort(self):
        return self.com1;

    #
    # This method should be called to read the output of a command
    # sent to UNO.  This method will wait forever till it can read
    # something on the serial port.
    #
    def readInput2(self):
        tdata="";
        # if serial.inWaiting() == 0:
        #     return tdata;
        while (self.serial.inWaiting() == 0):
            continue;
        #print (self.serial.inWaiting());
        while self.serial.inWaiting() > 0:
            tdata = self.serial.read();
            time.sleep(0.05)              # Sleep (or inWaiting() doesn't give the correct value)
            data_left = self.serial.inWaiting()  # Get the number of characters ready to be read
            #print (data_left," ",tdata);
            tdata += self.serial.read(data_left) # Do the read and combine it with the first character
        print ("done readinput2");
        return tdata;

    # def loop(self):
    #     self.getrtemp();
    #     while 1:
    #         self.getrtemp();
    #         time.sleep(4);

    # def getrtemp(self):
    #     self.serial.flushInput();
    #     self.serial.flushOutput();
    #     self.com1.send("GETR");
    #     time.sleep(self.tau);
    #     val = self.readInput2().split('\n')[0];
    #     if (val != ""):
    #         print (time.asctime(time.localtime())," ",self.pktNo," ",val);
    #         self.pktNo=self.pktNo+1;

    # def gettemp(self):
    #     self.serial.flushInput();
    #     self.serial.flushOutput();
    #     self.com1.send("GETT");
    #     time.sleep(self.tau);
    #     val = self.readInput2().split('\n')[0];
    #     if (val != ""):
    #         print (time.asctime(time.localtime())," ",self.pktNo," ",val);
    #         self.pktNo=self.pktNo+1;
    
