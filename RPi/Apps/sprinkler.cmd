./cmdnaarad.py RFM_SEND 16 4 10 1 # Set ping timeout to 10 sec
sleep 0.1
./cmdnaarad.py RFM_SEND 16 1 0 0  # Open the valve
sleep 0.1
./notify.py notify 16 01 ACKpkt: 120 2 # Wait for Open command to be executed
sleep 30
./cmdnaarad.py RFM_SEND 16 0 0 0  # Close the valve
sleep 0.1
./cmdnaarad.py RFM_SEND 16 4 60 1 # Set ping timeout to 60 sec

#./cmdnaarad.py RFM_SEND 16 4 60 1 
#./cmdnaarad.py RFM_SEND 16 4 10 1 
#./cmdnaarad.py RFM_SEND 16 1 0 0 
#./cmdnaarad.py RFM_SEND 16 4 60 1 
#./cmdnaarad.py RFM_SEND 16 4 10 1 
#./cmdnaarad.py RFM_SEND 16 0 0 0 

