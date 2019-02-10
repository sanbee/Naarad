import sys;
import time;
import signal
import threading;
from threading import Thread, Condition, Event, RLock;

condition = Condition();
counter=0;

class MyList(list):
    def __init__(self):
        self.lock = RLock()

    def append(self, val):
        self.lock.acquire()
        try:
            list.append(self, val)
        finally:
            self.lock.release()

    def remove(self,index):
        self.lock.acquire();
        try:
            del self[index];
        finally:
            self.lock.release();

    def findItem(self,aItem):
        self.lock.acquire();
        try:
            indices = [];
            n=len(self);
            for i in range(0,n):
                if (aItem == self[i]):
                    indices.append(i);
        finally:
            self.lock.release();
        return indices;

#
#------------------------------------Global functions----------------------------------------
#
class ClientList():
    def __init__(self):
        self.IDList = MyList();
        self.CondList = MyList();
        self.rlock = RLock();

    def getIDList(self):
        return self.IDList;
        
    def getCondList(self):
        return self.CondList;

    def NaaradNotify(self,nodeid=-1):
        global NotifyClient;
        #Notify all register threads
        if (nodeid < 0):
            with self.rlock:
                n=len(self.CondList);
                for i in range(n):
                    c=self.CondList[i];
                    c.acquire();
                    c.notify();
                    c.release();
        else:
            #Notify all registered threads with nodeid;
            with self.rlock:
                ndx=self.IDList.findItem(nodeid);
                n = len(ndx);
                for i in range(0,n):
                    c=self.CondList[ndx[i]];
                    c.acquire();
                    c.notify();
                    c.release();
        
    def register(self,thisID,cond):
        myIndex=-1;
        with self.rlock:
            myIndex=len(self.IDList);
            self.IDList.append(thisID);
            self.CondList.append(cond);
        return myIndex;

    def unregister(self,myCond):
        with self.rlock:
            try:
                myIndex=self.CondList.findItem(myCond);
                print 'Unregistering ',self.IDList[myIndex[0]];
                self.IDList.remove(myIndex[0]);
                self.CondList.remove(myIndex[0]);
            except IndexError:
                print "IndexError: ",self.IDList, myIndex;


NotifyClient=ClientList();
#
#------------------------------------Global functions----------------------------------------
#
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
        NotifyClient.NaaradNotify();

    def run(self):
        global counter, NotifyCounter;

        self.resume();
        while(True):
            if (counter < 0):
#                NaaradNotify();
                print "Exiting MT";
                break;
            with self.state:
                if (self.paused):
                    self.state.wait();
            print counter;
            time.sleep(2);
            counter += 1;
            #            if (counter%10==0):
            if (counter in NotifyClient.getIDList()):
                NotifyClient.NaaradNotify(counter);


class clientThread(Thread):
    def __init__(self,id):
        global ClientList;
        Thread.__init__(self)
        self.cond=Condition();
        self.myid=id;
        self.myIndex = -1;
        self.myIndex = NotifyClient.register(self.myid,self.cond);

    def getCondition(self):
        return self.cond;

    def run(self):
        global counter, ClientList;
        while(True):
            self.cond.acquire();
            self.cond.wait();
            print "CT: ",self.myid,counter;
            self.cond.release();

            # self.conditionEvent.acquire();
            # self.conditionEvent.wait();
            # print "CT: ",counter;
            # self.conditionEvent.release();
            if ((counter<0) or (counter>=20)):
                print "CT exiting ",self.myid;
                break;
        NotifyClient.unregister(self.cond);

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

