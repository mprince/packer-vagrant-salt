#!/bin/bash

# Allow sudo
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers

apt-get update

apt-get -y -q install linux-headers-$(uname -r) build-essential dkms nfs-common make gcc software-properties-common

# Install Vbox Guest Additions
mkdir /tmp/virtualbox
mount -o loop /home/vagrant/VBoxGuestAdditions.iso /tmp/virtualbox
sh /tmp/virtualbox/VBoxLinuxAdditions.run
umount /tmp/virtualbox
rmdir /tmp/virtualbox
rm /home/vagrant/*.iso

# install salt
add-apt-repository -y ppa:saltstack/salt
apt-get install -y salt-minion

# upgrade our system
apt-get -y upgrade
