# -*- sh -*-
./cmdnaarad.py RFM_SEND 16 4 10 1 # Set ping timeout to 10 sec
sleep 0.1
./notify.py notify 16 4 ACKpkt: 120 2 # Wait for timeout commond to be executed
#./notify.py notify 16 255 ACKpkt: 120 2 # Wait for a NoOp to be exectued
sleep 0.1
#
# Need to send this command twice.  The one immediately after the "notify" command above never triggers the solenoid.  The second one always
# does. Don't know why.
#
./cmdnaarad.py RFM_SEND 16 1 0 0  # Open the valve
./cmdnaarad.py RFM_SEND 16 1 0 0  # Open the valve
./notify.py notify 16 1 ACKpkt: 120 2 # Wait for a NoOp to be exectued
sleep 40
./cmdnaarad.py RFM_SEND 16 0 0 0  # Close the valve
sleep 0.1
./cmdnaarad.py RFM_SEND 16 4 60 0 # Set ping timeout to 60 sec

#./cmdnaarad.py RFM_SEND 16 4 60 1 
#./cmdnaarad.py RFM_SEND 16 4 10 1 
#./cmdnaarad.py RFM_SEND 16 1 0 0 
#./cmdnaarad.py RFM_SEND 16 4 60 1 
#./cmdnaarad.py RFM_SEND 16 4 10 1 
#./cmdnaarad.py RFM_SEND 16 0 0 0 

