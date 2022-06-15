#!/bin/bash


# Repair "==> default: stdin: is not a tty" message
sudo sed -i '/tty/!s/mesg n/tty -s \\&\\& mesg n/' /root/.profile

# Fix for https://github.com/ansible/ansible/issues/51663
UNIT='apt-daily-upgrade.timer'
DIR="/etc/systemd/system/${UNIT}.d"
mkdir -p $DIR
echo -e "[Timer]\nPersistent=false" > ${DIR}/override.conf
systemctl daemon-reload

# Wait for cloud-init
cloud-init status --wait

# Wait for ubuntu system wide updates for at least 15 seconds; cloud-init may not wait for these
# i="0"
# while [ $i -lt 15 ] 
# do 
# if [ $(fuser /var/lib/dpkg/lock) ]; then 
#   # Reset timer if dpkg is locked
#   i="0" 
# fi 
# sleep 1 
# i=$[$i+1] 
# done

# In order to avoid the message
# "==> default: dpkg-preconfigure: unable to re-open stdin: No such file or directory"
# use " > /dev/null 2>&1" in order to redirect stdout to /dev/null
# For more info see http://stackoverflow.com/questions/10508843/what-is-dev-null-21
 
echo 'Provisioning virtual machine...'
 
# Git
echo 'Installing ...'
#sudo apt-get -y install git
#sudo apt-get -y install git > /dev/null 2>&1
sudo apt-get -y update
#sudo apt-get install -y software-properties-common 
#sudo apt-get --no-install-recommends install virtualbox-guest-utils
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt install -y ansible

#echo 'Removing Git...'
#sudo apt-get -y purge git
#sudo apt-get -y purge git > /dev/null 2>&1