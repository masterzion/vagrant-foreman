# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	config.vm.define "foreman" do |foreman|
		config.vm.box = "ubuntu/xenial64"
		config.vm.network "forwarded_port", guest: 443, host: 8081

		#  config.vm.network "public_network", bridge: "eth2", ip: "192.168.57.10"
		#  config.vm.network "private_network", ip: "192.168.50.4"

		config.vm.synced_folder ".", "/vagrant", disabled: true
		config.vm.hostname = "foreman.localdomain"


		config.vm.provider "virtualbox" do |vb|
			vb.gui = false
			vb.name = "Foreman-150"
			vb.memory = "2048"
		end

		#  documentation for more information about their specific syntax and use.
		#  config.vm.provision "shell", inline: <<-SHELL
		#  SHELL

		config.vm.provision :shell, :path => "files/script.sh"
	end

	config.vm.define "box1" do |foreman|
		config.vm.box = "ubuntu/xenial64"
		config.vm.hostname = "foreman.localdomain"
		
		config.vm.provider "virtualbox" do |vb|
			vb.gui = false
			vb.name = "box1"
			vb.memory = "512"
		end

	end

	
end
