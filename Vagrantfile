# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	config.vm.define "foreman" do |foreman|
		foreman.vm.box = "ubuntu/xenial64"
		foreman.vm.network "forwarded_port", guest: 443, host: 8081

		#  config.vm.network "public_network", bridge: "eth2", ip: "192.168.57.10"
		#  config.vm.network "private_network", ip: "192.168.50.4"

		foreman.vm.synced_folder ".", "/vagrant", disabled: true
		foreman.vm.hostname = "foreman.localdomain"


		foreman.vm.provider "virtualbox" do |vb|
			vb.gui = false
			vb.name = "Foreman150"
			vb.memory = "2048"
		end

		#  documentation for more information about their specific syntax and use.
		#  config.vm.provision "shell", inline: <<-SHELL
		#  SHELL

		foreman.vm.provision :shell, :path => "files/script.sh"
	end

	config.vm.define "box1" do |box1|
		box1.vm.box = "ubuntu/xenial64"
		box1.vm.hostname = "box1.localdomain"
		
		box1.vm.provider "virtualbox" do |vb|
			vb.gui = false
			vb.name = "box1"
			vb.memory = "512"
		end

	end

	
end
