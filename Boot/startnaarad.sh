
#ssh pi@192.168.0.126 "bash -s" -- < /tmp/ex_bash "-time" "bye"
#ssh serverA "bash -s" -- < ./ex.bash
cd /mnt/flash1/Naarad/Boot
killall -9 screen
screen -wipe
sh naaradboot.github.sh 
sleep 5
/mnt/flash1/Naarad/RPi/Apps/cmdnaarad.py RFM_SEND 15 4 60 1
/mnt/flash1/Naarad/RPi/Apps/cmdnaarad.py RFM_SEND 17 4 60 1
