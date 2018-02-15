import socket;
import time;
from socket import error as SocketError
import errno
import sys

class mysocket:
    '''demonstration class only
      - coded for clarity, not efficiency
    '''

    def __init__(self, sock=None):
        if sock is None:
            self.sock = socket.socket(
                socket.AF_INET, socket.SOCK_STREAM)
        else:
            self.sock = sock
        self.inactivityLevel=0;

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

    def incrementInactivityLevel(self):
        self.inactivityLevel=self.inactivityLevel+1;

    def resetInactivityLevel(self):
        self.inactivityLevel=0;

    def getInactivityLevel(self):
        return self.inactivityLevel;

    def send(self, msgIn,postfix=""):
        msg = msgIn.strip();
        msglen = len(msg+' ');
        msglen = msglen+len(str(msglen));

        snd_msg = str(msglen)+' '+msg;
        snd_msg = snd_msg.strip()+postfix;
        msglen = len(snd_msg);
        #print "Sending: \""+snd_msg+"\"";
        totalsent = 0;
        try:
            while (totalsent < msglen):
                sent = self.sock.send(snd_msg[totalsent:])
                if sent == 0:
                    raise RuntimeError("socket connection broken")
                totalsent = totalsent + sent
        except SocketError as e:
            if e.errno != errno.ECONNRESET:
                raise RuntimeError("mySock::send: connection reset by peer")
            else:
                raise RuntimeError("mySock::send: unknown socket error"); 
    
    def receive(self):
        chunks     = []
        #bytes_recd = 0
        try:
            preamble   = self.sock.recv(16);
            bytes_recd = len(preamble);
            if (bytes_recd == 0):
                return "";
            preamble = preamble.strip();
            pktlen_str = preamble.split(' ')[0];
            len_len    = len(pktlen_str);
            if (len(pktlen_str) == 0):
                return "";
        
            MSGLEN     = eval(pktlen_str);
            chunks      = preamble[len_len:];
            # if (len(chunks) == 0):
            #     return "";
            #bytes_recd = len(chunks);
            #print "len=",MSGLEN, "bytes_recd=",bytes_recd,"chunks="+chunks, "preamble="+preamble;

            while (bytes_recd < MSGLEN):
                chunk0 = self.sock.recv(min(MSGLEN - bytes_recd, 2048))
                if chunk0 == '':
                    raise RuntimeError("socket connection broken")
            #print chunks,'+',chunk0;
                chunks = chunks + chunk0;
                bytes_recd = bytes_recd + len(chunks)
        except SocketError as e:
            if e.errno != errno.ECONNRESET:
                raise RuntimeError("mySock::receive: connection reset by peer"); 
            else:
                raise RuntimeError("mySock::receive: unknown socket error"); 
            return "";

        #print "All chunks="+chunks;
        return ''.join(chunks)


SERVER="localhost";
PORT=1234;

tt=sys.argv[1];
for i in range(2,len(sys.argv)):
	tt=tt+" "+sys.argv[i]
#CMD=sys.argv[1];
#OP=sys.argv[2];
#ID=sys.argv[3];
#PORTNO=sys.argv[4];
#TIMEOUT=sys.argv[5];
#FULLCMD=CMD+" "+OP+" "+ID+" "+PORTNO+" "+TIMEOUT;

FULLCMD=tt;

print FULLCMD;
naaradSoc=mysocket();
naaradSoc.connect(SERVER,PORT);
naaradSoc.send("open");time.sleep(0.1);
naaradSoc.send(FULLCMD);#time.sleep(1);
naaradSoc.send("done");time.sleep(0.1);
naaradSoc.close();
