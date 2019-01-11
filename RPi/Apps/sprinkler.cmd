./cmdnaarad.py RFM_SEND 16 4 10 1 # Set ping timeout to 10 sec
./cmdnaarad.py RFM_SEND 16 1 0 0  # Open the valve
sleep 60
./cmdnaarad.py RFM_SEND 16 0 0 0  # Close the valve
./cmdnaarad.py RFM_SEND 16 4 60 1 # Set ping timeout to 60 sec

#./cmdnaarad.py RFM_SEND 16 4 60 1 
#./cmdnaarad.py RFM_SEND 16 4 10 1 
#./cmdnaarad.py RFM_SEND 16 1 0 0 
#./cmdnaarad.py RFM_SEND 16 4 60 1 
#./cmdnaarad.py RFM_SEND 16 4 10 1 
#./cmdnaarad.py RFM_SEND 16 0 0 0 

