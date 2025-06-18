HOST=pi@192.168.0.126
echo "----------------------------------------"
echo "Remote reboot on host "$HOST
echo "----------------------------------------"

ssh $HOST "bash -s" -- << 'EOF'
cd /mnt/flash1/Naarad/Boot
killall -9 screen
screen -wipe
sh naaradboot.github.sh 
sleep 5
/mnt/flash1/Naarad/RPi/Apps/cmdnaarad.py RFM_SEND 15 4 60 1
/mnt/flash1/Naarad/RPi/Apps/cmdnaarad.py RFM_SEND 17 4 60 1
EOF
