import sys
sys.path.insert(0, '..');

import settings5 as s5;
from threading import Condition;
s5.init();

c=Condition();
pktID=[1,'ACKpkt:'];
s5.gClientList.register(16,c,pktID);
pktID=[0,'ACKpkt:'];
s5.gClientList.register(16,c,pktID);

print s5.gClientList.getIDList();
print s5.gClientList.getPktIDList();
print s5.gClientList.isValid(0,1,'ACKpkt:');
print s5.gClientList.isValid(1,1,'ACKpkt:');
