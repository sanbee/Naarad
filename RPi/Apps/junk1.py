import time;
#
# This is a script to star a particular sprinkler circute on a Naarad
# Sprinker Controller V2.0 (6 ports).  The opeerateSolenoid() function
# below send the command "cmd" on port "port" of the Naarad node
# "node".  This function is a Naarad-system fuction -- i.e. it needs
# to be send to the Naarad sever via the sendscript.py script.
#
# The entire script below is sent to the Naarad sever via the
# sendscript.py script.  The script consistes of the operateSolenoid()
# function, which is exected to achieve the following:
#   - open port 1 on node 17
#   - sleep for specified lenght of time
#   - close port 1 on node 17
#
# The sequence of command below are:
#
#  1. Set the ping timout on the node to 10 sec.  This, so that the
#     node reacts to the commands faster (than the typical 60 sec cadence
#     of all nodes).
#
#  2. Wait for command (1) to be executed
#  3. Wait a bit more for a NoOp command (just to be sure that (1) is executed)
#  4. Set the pulse width to 10 sec
#  5. Wait for the ACK of the pulse-width command to finish
#  6. Send the command to open the valve
#  7. Wait for the ACK for the open command
#  8. Set the pulse-width to zero.  This is a workaround for a
#     hardware bug where the controller seems to automatically issue the
#     close command after 1 min.  That command is still issued, but with
#     this it does not close the port.
#  9. Wait for the ACK for the pulse-width command
# 10. Set the ping time back to 60 sec.
#
# operateSolenoid is called, first to open the port 0 on node 17.
#
# Next, a sleep command is executed for the time for which the port is
# needed to be kept open.  This sleep is also executed in a thread
# serving this script on the Naarad server.
#
# At the end of the sleep period, command to close the port 0 on node 17 is issued.
def operateSolenoid(self,node,port,cmd):
    global time;
    time.sleep(10.0);

#operateSolenoid(self,17,0,1);
#time.sleep(3600*1);
#time.sleep(20);
operateSolenoid(self,17,0,0);

