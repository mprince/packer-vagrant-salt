Packer + Vagrant + Salt Masterless
==================================

My company is looking to move to Packer for building machine images for VirtualBox, VMWare and Amazon EC2,
Vagrant for local development and all provisioned using SaltStack.

This is a complete example that will build a base image from the latest Ubuntu 14.04 release, install the salt 
minion and launch the image using Vagrant.  Adding EC2 builds will be added a later date as we're currently
trying to get our development environment up and running.

The salt formula will install nginx.  Making salt do more interesting things is outside the scope of this 
repository.

For more details please visit http://scottsearle.me

### Requirements

- Packer - https://www.packer.io
- Vagrant - https://www.vagrantup.com
- VirtualBox - https://www.virtualbox.org

### Instructions

To initialize this example:

- git clone https://github.com/theshoelace/packer-vagrant-salt.git
- cd packer-vagrant-salt
- packer build ubuntu-base.json
- vagrant up

Browse to http://192.168.56.125 and you should see the welcome page for nginx.

### Connecting

- vagrant ssh

### Cleanup

- vagrant destroy
