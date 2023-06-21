import time;
def operateSolenoid(node,port,cmd):
    self.messageHandler("RFM_SEND node 4 10 1"); # Set ping timeout to 10 sec
    time.sleep(0.1);
    self.messageHandler("notify node 4 ACKpkt: 120 2"); # Wait for timeout commond to be executed
    self.messageHandler("notify node 255 ACKpkt: 120 2"); # Wait for a NoOp to be exectued

    time.sleep(1)
    self.messageHandler("RFM_SEND node 5 4 10");  # set pulse width to 40ms (to get around a bug that closes the port after 1min!)
    self.messageHandler("notify node 5 ACKpkt: 120 2") # wait for a pulse-width commmand (5) to be exectued
    
    self.messageHandler("RFM_SEND node cmd port 0");  # Open the valve
    self.messageHandler("notify node cmd ACKpkt: 120 2"); # Wait for a Open (1) to be exectued

    self.messageHandler("RFM_SEND node 5 0 0");  # Set pulse width to zero (to get around a bug that closes the port after 1min!)
    self.messageHandler("notify node 5 ACKpkt: 120 2") # Wait for a Pulse-width command (5) to be exectued
    
    time.sleep(0.1);
    self.messageHandler("RFM_SEND node 4 60 0"); # Set ping timeout to 60 sec

self.messageHandler("notify 3 -1 naaradsim 120 2");
self.messageHandler("RFM_SEND 1 5 4 10");
time.sleep(11.0);
self.messageHandler("RFM_SEND 1 4 60 0");
