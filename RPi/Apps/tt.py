import time;
def operateSolenoid(self,node,port,cmd):
    global time;
    self.messageHandler("RFM_SEND "+str(node)+" 4 10 1"); # Set ping timeout to 10 sec
    time.sleep(0.1);
    self.messageHandler("notify "+str(node)+" 4 ACKpkt: 120 2"); # Wait for timeout commond to be executed
    self.messageHandler("notify "+str(node)+" 255 ACKpkt: 120 2"); # Wait for a NoOp to be exectued
    #self.messageHandler("notify "+str(node)+" -1 naaradsim 120 2"); # Wait for a NoOp to be exectued

    time.sleep(1)
    self.messageHandler("RFM_SEND "+str(node)+" 5 4 10");  # set pulse width to 40ms (to get around a bug that closes the port after 1min!)
    self.messageHandler("notify "+str(node)+" 5 ACKpkt: 120 2") # wait for a pulse-width commmand (5) to be exectued
    
    self.messageHandler("RFM_SEND "+str(node)+" "+str(cmd)+" "+str(port)+" 0");  # Open the valve
    self.messageHandler("notify "+str(node)+" "+str(cmd)+" ACKpkt: 120 2"); # Wait for a Open (1) to be exectued

    self.messageHandler("RFM_SEND "+str(node)+" 5 0 0");  # Set pulse width to zero (to get around a bug that closes the port after 1min!)
    self.messageHandler("notify "+str(node)+" 5 ACKpkt: 120 2") # Wait for a Pulse-width command (5) to be exectued
    
    time.sleep(0.1);
    self.messageHandler("RFM_SEND "+str(node)+" 4 60 0"); # Set ping timeout to 60 sec

#operateSolenoid(self,17,0,1);
#time.sleep(3600*4);
#time.sleep(20);
operateSolenoid(self,17,0,0);

