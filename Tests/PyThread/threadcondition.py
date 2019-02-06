import time;
from threading import Thread, Condition, Event;

condition = Condition();
counter=0;

class mainThread(Thread):
    def __init__(self,mycondition):        
        Thread.__init__(self)
        self.conditionEvent = mycondition;
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
        global counter;

        self.resume();
        while(True):
            if (counter < 0):
                condition.acquire();
                condition.notify();
                condition.release();
                break;
            with self.state:
                if (self.paused):
                    self.state.wait();
            print counter;
            time.sleep(2);
            counter += 1;
            if (counter%10==0):
                condition.acquire();
                condition.notify();
                condition.release();


class clientThread(Thread):
    def __init__(self,mycondition):        
        Thread.__init__(self)
        self.conditionEvent = mycondition;

    def run(self):
        global counter;
        while(True):
            self.conditionEvent.acquire();
            self.conditionEvent.wait();
            print "CT: ",counter;
            self.conditionEvent.release();
            if (counter<0):
                print "CT exiting";
                break;
