#!/bin/bash

# Allow sudo
#sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
#sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers

sudo apt-get update

sudo apt-get -y -q install linux-headers-$(uname -r) build-essential dkms nfs-common make gcc software-properties-common

# Install Vbox Guest Additions
sudo mkdir /tmp/virtualbox
sudo mount -o loop /home/vagrant/VBoxGuestAdditions.iso /tmp/virtualbox
sudo sh /tmp/virtualbox/VBoxLinuxAdditions.run
sudo umount /tmp/virtualbox
sudo rmdir /tmp/virtualbox
sudo rm /home/vagrant/*.iso

# install salt
sudo add-apt-repository -y ppa:saltstack/salt
sudo apt-get install -y salt-minion

# upgrade our system
sudo apt-get -y upgrade
