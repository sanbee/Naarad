import sys;
import time;
import signal
import threading;
from threading import Thread, Condition, Event, RLock;

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
        # Lists with thread-safe methods
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
                    with c:
                        c.notify();
        else:
            #Notify all registered threads with nodeid;
            with self.rlock:
                threadIndices=self.IDList.findItem(nodeid);
                n = len(threadIndices);
                for i in range(0,n):
                    c=self.CondList[threadIndices[i]];
                    with c:
                        c.notify();
        
    def register(self,thisID,cond):
        myIndex=-1;
        with self.rlock:
            myIndex=len(self.IDList);
            self.IDList.append(thisID);
            self.CondList.append(cond);
        return myIndex;

    # Using the lock of the thread calling this method to uniquely identify the thread in
    # the list of threads.  This assumes that the private lock of each thread will not be
    # equal to the similar private lock of any other thread.
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
    def __init__(self,id,nn):
        global ClientList;
        Thread.__init__(self)
        self.cond=Condition();
        self.myid=id;
        self.myIndex = -1;
        self.myIndex = NotifyClient.register(self.myid,self.cond);
        self.nn=nn;

    def getCondition(self):
        return self.cond;

    def run(self):
        global counter, ClientList;
        while(True):
            with self.cond:
                self.cond.wait();
                print "CT: ",self.myid,counter;

            if (counter%self.nn == 0):
#            if ((counter<0) or (counter>=20)):
                print "CT exiting ",self.myid,self.nn;
                break;
        NotifyClient.unregister(self.cond);

t0=mainThread();
t1=clientThread(10,10);
t2=clientThread(15,3);
t3=clientThread(15,2);

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

