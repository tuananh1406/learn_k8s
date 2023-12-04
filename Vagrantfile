# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "alvistack/ubuntu-23.04"
  config.ssh.insert_key = true
  config.ssh.forward_agent = false
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provision "file", source: "learn_k8s_key", destination: "~/.ssh/learn_k8s_key"
  config.vm.provision "file", source: "learn_k8s_key.pub", destination: "~/.ssh/learn_k8s_key.pub"
  config.vm.provision "shell", path: "cloud-init.sh"
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
    vb.linked_clone = true
  end

  # Master cluster
  config.vm.define "master1" do |app|
    app.vm.hostname = "master1"
    app.vm.network "private_network", ip: "192.168.56.11"
    # Provisioning configuration for Ansible
    # app.vm.provision "ansible" do |ansible|
    #   ansible.playbook = "webserver.yml"
    #   ansible.tags = "install"
    #   # ansible.tags = "install-backend"
    #   ansible.verbose = 6
    # end
  end
  config.vm.define "master2" do |app|
    app.vm.hostname = "master2"
    app.vm.network "private_network", ip: "192.168.56.12"
  end
  config.vm.define "master3" do |app|
    app.vm.hostname = "master3"
    app.vm.network "private_network", ip: "192.168.56.13"
  end

  # Worker cluster
  config.vm.define "worker1" do |app|
    app.vm.hostname = "worker1"
    app.vm.network "private_network", ip: "192.168.56.14"
  end
  config.vm.define "worker2" do |app|
    app.vm.hostname = "worker2"
    app.vm.network "private_network", ip: "192.168.56.15"
  end
  config.vm.define "worker3" do |app|
    app.vm.hostname = "worker3"
    app.vm.network "private_network", ip: "192.168.56.16"
  end

  # Gitlab
  config.vm.define "gitlab" do |app|
    app.vm.hostname = "gitlab"
    app.vm.network "private_network", ip: "192.168.56.17"
  end
  # Ranche
  config.vm.define "rancher" do |app|
    app.vm.hostname = "rancher"
    app.vm.network "private_network", ip: "192.168.56.18"
  end
  # Run CICD
  config.vm.define "cicd" do |app|
    app.vm.hostname = "cicd"
    app.vm.network "private_network", ip: "192.168.56.19"
  end

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Disable the default share of the current code directory. Doing this
  # provides improved isolation between the vagrant box and your host
  # by making sure your Vagrantfile isn't accessable to the vagrant box.
  # If you use this you may want to enable additional shared subfolders as
  # shown above.
  # config.vm.synced_folder ".", "/vagrant", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
