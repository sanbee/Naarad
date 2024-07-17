import socket;
from socket import error as SocketError
import errno

SOC_MSGLEN_DIGITS=5;
SOC_RECV_TIMEOUT=1.0;
SOC_RECV_TRIALS=5;
SOC_FMT_MSGLEN='0'+str(SOC_MSGLEN_DIGITS)+'d'; # E.g., '05d'

class mysocket:
    '''Socket wrapper class with robust send and recevie methods
    '''

    def __init__(self, sock=None):
        if sock is None:
            self.sock = socket.socket(
                socket.AF_INET, socket.SOCK_STREAM)
        else:
            self.sock = sock
        #self.inactivityLevel=0;

    def fileno(self):
        return self.sock.fileno();

    def getSock(self):
        return self.sock;

    def connect(self, host, port):
        self.sock.connect((host, port))

    def close(self):
        self.sock.close();

    def setblocking(self,mode):
        self.sock.setblocking(mode);

    # def incrementInactivityLevel(self):
    #     self.inactivityLevel=self.inactivityLevel+1;

    # def resetInactivityLevel(self):
    #     self.inactivityLevel=0;

    # def getInactivityLevel(self):
    #     return self.inactivityLevel;

    # Covert the given number to string in a fixed format.
    def intToStr(self,i):
        return format(i,SOC_FMT_MSGLEN);

    def send_tst(self,msgIn):
        snd_msg = msgIn;
        msglen = len(snd_msg);
        #print "Sending: \""+snd_msg+"\"";
        totalsent = 0;
        try:
            while (totalsent < msglen):
                sent = self.sock.send(snd_msg[totalsent:].encode("UTF-8"))
                if sent == 0:
                    raise RuntimeError("socket connection broken")

                totalsent = totalsent + sent

        except SocketError as e:
            if e.errno != errno.ECONNRESET:
                raise RuntimeError("mySock::send: connection reset by peer")
            else:
                raise RuntimeError("mySock::send: unknown socket error"); 
        
    def send(self, msgIn,postfix=""):
        msglen = len(msgIn+' ');
        msglen_str=self.intToStr(msglen);
        msglen = msglen+len(msglen_str);
        msglen_str=self.intToStr(msglen);

        snd_msg = msglen_str+' '+msgIn;
        snd_msg = snd_msg+postfix;
        msglen = len(snd_msg);
        #print "Sending: \""+snd_msg+"\"";
        totalsent = 0;
        try:
            while (totalsent < msglen):
                sent = self.sock.send(snd_msg[totalsent:].encode("UTF-8"))
                if sent == 0:
                    raise RuntimeError("socket connection broken")

                totalsent = totalsent + sent

        except SocketError as e:
            if e.errno != errno.ECONNRESET:
                raise RuntimeError("mySock::send: connection reset by peer")
            else:
                raise RuntimeError("mySock::send: unknown socket error"); 
    
    # Read N chars from the socket with a timeout.  Make
    # SOC_RECV_TRIALS number of trials.
    def getNChar(self,n,blocking):
        bytesRecvd=0;
        val=str('').encode('utf-8');
        trials=0;
        # if (blocking==False):
        #     self.sock.settimeout(SOC_RECV_TIMEOUT);
        while ((bytesRecvd < n) and (trials < SOC_RECV_TRIALS)):
            val += (self.sock.recv(min(n - bytesRecvd, 2048)));
            bytesRecvd = len(val);
            trials += 1;
        # self.sock.settimeout(0.0);# Set the socket to blocking
        return val.decode('utf-8'), bytesRecvd;

    def receive(self,doblocking=True):
        chunks     = [];

        try:
            # Get the packet length
            #preamble, bytes_recd = self.getNChar(SOC_MSGLEN_DIGITS,doblocking);
            #preamble, bytes_recd = self.getNChar(16,doblocking);
            preamble = self.sock.recv(16);
            preamble = preamble.decode('utf-8');
            bytes_recd=len(preamble);

            # Guard against incomplete read of the packet length.  Can't recover from this.
            if ((bytes_recd > 0) and (bytes_recd < SOC_MSGLEN_DIGITS)):
                raise RuntimeError("could not read "+str(SOC_MSGLEN_DIGITS)+" chars to get the msg len from socket");

            #print("Preamble: \'"+preamble+"\'");

            if (bytes_recd == 0):
                return "";

            pktlen_str = preamble.split(' ')[0];
            len_len    = len(pktlen_str);
            if (len(pktlen_str) == 0):
                return "";
        
            chunks     = preamble[len_len:];
            MSGLEN     = int(pktlen_str)-bytes_recd;
            #print ("###pktlen_str:",pktlen_str,len_len,chunks,MSGLEN);

            #print ("len=",MSGLEN, "bytes_recd=",bytes_recd,"chunks="+chunks, "preamble="+preamble);

            # Now get the rest of the packet who's length is now known.
            if (MSGLEN > 0):
                chunk0, N = self.getNChar(MSGLEN,doblocking);
                if chunk0 == '':
                    raise RuntimeError("socket connection broken");
                chunks += chunk0;

        except KeyboardInterrupt:
            raise KeyboardInterrup("\nCtrl-C in mySock::receive().");
        except SocketError as e:
            if e.errno == errno.ECONNRESET:
                raise RuntimeError("mySock::receive: connection reset by peer"); 
            elif e.errno == errno.EBADF:
                raise RuntimeError("mySock::receive: Bad file descriptor"); 
            else:
                raise;
            return "";

        return ''.join(chunks)
