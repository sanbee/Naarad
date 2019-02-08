import sys;
import time;
import signal
from threading import Thread, Condition, Event;

condition = Condition();
counter=0;
NotifyClient={};
NotifyClient['id']=[];
NotifyClient['cond']=[];

def findItem(aItem, aList):
    indices = [];
    n=len(aList);
    for i in range(0,n):
        if (aItem == aList[i]):
            indices.append(i);
    return indices;

def NaaradNotify(nodeid=-1):
    global NotifyClient;
    #Notify all register threads
    if (nodeid < 0):
        for i in range(len(NotifyClient['id'])):
            c=NotifyClient['cond'][i];
            c.acquire();
            c.notify();
            c.release();
    else:
        #Notify all registered threads with nodeid;
        ndx=findItem(nodeid,NotifyClient['id']);
        n = len(ndx);
        for i in range(0,n):
            c=NotifyClient['cond'][ndx[i]];
            c.acquire();
            c.notify();
            c.release();
        

class mainThread(Thread):
    def __init__(self):
        Thread.__init__(self)
        self.state = Condition();
        self.paused=True;
        self.deamon=True;

    def pause(self):
        with self.state:
            self.paused=True;

    def resume(self):
        with self.state:
            self.paused = False
            self.state.notify()  # Unblock self if waiting.

    def exit(self):
        global counter;
        counter=-10;

    def run(self):
        global counter, NotifyCounter;

        self.resume();
        while(True):
            if (counter < 0):
                NaaradNotify();
                print "Exiting MT";
                break;
            with self.state:
                if (self.paused):
                    self.state.wait();
            print counter;
            time.sleep(2);
            counter += 1;
            #            if (counter%10==0):
            if (counter in NotifyClient['id']):
                NaaradNotify(counter);


class clientThread(Thread):
    def __init__(self,myid):
        global ClientNotification;
        Thread.__init__(self)
        self.cond=Condition();
        self.id=myid;
        self.register(self.id,self.cond);

    def register(self,id,cond):
        NotifyClient['id'].append(id);
        NotifyClient['cond'].append(cond);

    def unregister(self):
        (NotifyClient['id']).remove(self.id);
        (NotifyClient['cond']).remove(self.cond);
        

    def run(self):
        global counter;
        while(True):
            self.cond.acquire();
            self.cond.wait();
            print "CT: ",self.id,counter;
            self.cond.release();

            # self.conditionEvent.acquire();
            # self.conditionEvent.wait();
            # print "CT: ",counter;
            # self.conditionEvent.release();
            if ((counter<0) or (counter>=20)):
                print "CT exiting ",self.id;
                break;
            self.unregister();

t0=mainThread();
t1=clientThread(10);
t2=clientThread(20);
t3=clientThread(20);

t0.start();t1.start();t2.start();t3.start();

# try:
#     t0.start(); t1.start();
# except KeyboardInterrupt:
#     t0.exit();

# def signal_handler(sig, frame):
#         print('You pressed Ctrl+C!')
#         t0.exit();
#         sys.exit(0)
# signal.signal(signal.SIGINT, signal_handler)

