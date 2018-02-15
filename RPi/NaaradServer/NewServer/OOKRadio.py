#
# Bit pattern to be transmitted for Etekcity RF Controlled Remote Sockets
#
import time;
class OOKRadio:
    '''
    Interface to the OOK radio.  Currently this object works for
    Etekcity RF controlled switches.  Bit pattern to be transmitted
    for Etekcity RF Controlled Remote Sockets are hardcoded.
    '''
    def __init__(self,comport):
        self.comport=comport;
        self.syncBits = "00010001010101";
        self.onBits = "0011 ";
        self.offBits = "1100 ";
        self.addressBits = ("010011","011100","110000");
        self.addressAllBits = ("111111","101011100","101110000");
        # self.onArray  = ("00010001010101 010011 0011 ","00010001010101 011100 0011 ","00010001010101 110000 0011 "); # On sequence
        # self.offArray = ("00010001010101 010011 1100 ","00010001010101 011100 1100 ","00010001010101 110000 1100 "); # Off sequence

        self.onArray  = ("000100010101010100110011 ","000100010101010111000011 ","000100010101011100000011 "); # On sequence
        self.offArray = ("000100010101010100111100 ","000100010101010111001100 ","000100010101011100001100 "); # Off sequence

    def tell(self,switch,turnon=True):
        N = len(self.onArray);
        if (switch >= N):
            print ("Unknown switch ID");
            return;

        if (switch < 0):
            for i in range(N):
                if (turnon):
                    self.comport.send(("SEND "+self.syncBits + self.addressBits[i] + self.onBits ));
                    # Do not understand why this delay is required
                    time.sleep(0.1); 
                else:
                    self.comport.send(("SEND "+self.syncBits + self.addressBits[i] + self.offBits ));
                    time.sleep(0.1);
            return;

        if (turnon):
            self.comport.send(("SEND "+self.syncBits + self.addressBits[switch] + self.onBits));
        else:
            self.comport.send(("SEND "+self.syncBits + self.addressBits[switch] + self.offBits));
