# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
	config.vm.define "foreman" do |foreman|
		foreman.vm.box = "ubuntu/xenial64"
		foreman.vm.network "forwarded_port", guest: 443, host: 8081
		
		foreman.vm.network "public_network", ip: "10.0.0.10"
		foreman.vm.hostname = "foreman.localdomain"
		
		foreman.vm.synced_folder ".", "/vagrant", disabled: true

		foreman.vm.provider "virtualbox" do |vb|
			vb.gui = false
			vb.name = "Foreman150"
			vb.memory = "2048"
		end

		foreman.vm.provision :shell, :path => "files/script_foreman.sh"
	end

	config.vm.define "box1" do |box1|
		box1.vm.box = "ubuntu/xenial64"
	
		box1.vm.hostname = "box1.localdomain"
		box1.vm.network "public_network", ip: "10.0.0.11"
		
		box1.vm.synced_folder ".", "/vagrant", disabled: true

		box1.vm.provider "virtualbox" do |vb|
			vb.gui = false
			vb.name = "box1"
			vb.memory = "512"
		end

		box1.vm.provision :shell, :path => "files/script_boxes.sh"
	end

	
end
