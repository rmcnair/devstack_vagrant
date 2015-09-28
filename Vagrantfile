# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "box-cutter/ubuntu1404-desktop"
  config.vm.box_check_update = false
  config.vm.provision "shell", path: "setup_devstack.sh"
  
  # If true, then any SSH connections made will enable agent forwarding.
  # Default value: false
  config.ssh.forward_agent = true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
     # Don't boot with headless mode
     vb.gui = true

     # Use VBoxManage to customize the VM. For example to change memory:
     vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
     vb.customize ["modifyvm", :id, "--memory", "8192"]
     vb.customize ["modifyvm", :id, "--cpus", "4"]
     vb.customize ["modifyvm", :id, "--vram", "32"]
     vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
     vb.customize ["modifyvm", :id, "--audio", "null"]
     vb.customize ["modifyvm", :id, "--audiocontroller", "hda"]
   end

end
  
