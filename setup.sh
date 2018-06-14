#!/bin/bash

NUM=$RANDOM
NEWHOSTNAME=rpi$NUM
NEWPASSWORD=pi$NUM

echo Provisioning Pi
echo 
echo new hostname: $NEWHOSTNAME
echo new password for user pi: $NEWPASSWORD
echo Pi will be rebooted at the end.
echo Press Enter to start or CTRL-C to abort.
read

# updating package index
sudo apt update

# enabling ssh server
sudo systemctl enable ssh
sudo systemctl start ssh

# installing rdp server
#
# TODO alternative: use real vnc?
sudo apt-get remove xrdp realvnc-vnc-server
sudo apt-get install xrdp

# change hostname
sudo hostname $NEWHOSTNAME

# changing password of user pi
echo "pi:$NEWHOSTNAME" | sudo chpasspwd

# rebooting
sudo reboot