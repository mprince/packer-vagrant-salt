# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.define "UbuntuVM" do |ubuntu|
        # fix tty errors on ubuntu
        ubuntu.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

        ubuntu.vm.box = "UbuntuVM"
        ubuntu.vm.box_url = "file://./builds/VirtualBox-ubuntu1404.box"

        ubuntu.vm.network "private_network", ip: "192.168.56.125"

        ubuntu.vm.provider :virtualbox do |vb|
            vb.customize ["modifyvm", :id, "--memory", "4096"]
            vb.customize ["modifyvm", :id, "--vram", "12"]
            vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            vb.name = "UbuntuVM"
        end

        ubuntu.ssh.forward_agent = true
        ubuntu.ssh.username = "vagrant"
        ubuntu.ssh.password = "vagrant"

        ubuntu.vm.synced_folder "salt/", "/srv/salt"
        ubuntu.vm.provision :salt do |salt|
            salt.minion_config = "salt/minion"
            salt.run_highstate = true
            salt.colorize = true
            salt.log_level = "info"
        end
    end
end
