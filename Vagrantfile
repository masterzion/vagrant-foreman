# -*- mode: ruby -*-
# vi: set ft=ruby :


# PS: tested with Vagrant 2.0 and virtualbox 5.1.28

Vagrant.configure(2) do |config|
	config.vm.define "foreman" do |foreman|
		foreman.vm.box = "ubuntu/xenial64"
		foreman.vm.network "forwarded_port", guest: 443, host: 8081
		
		foreman.vm.network "public_network", ip: "10.0.0.10"
		foreman.vm.hostname = "foreman.localdomain"
		
		foreman.vm.synced_folder ".", "/vagrant", disabled: false

		foreman.vm.provider "virtualbox" do |vb|
			vb.gui = false
			vb.name = "Foreman150"
			vb.memory = "4096"
		end

		foreman.vm.provision :shell, :path => "files/script_foreman.sh"
	end

	config.vm.define "box1" do |box1|
		box1.vm.box = "ubuntu/xenial64"
	
		box1.vm.hostname = "box1.localdomain"
		box1.vm.network "public_network", ip: "10.0.0.11"

		box1.vm.provider "virtualbox" do |vb|
			vb.gui = false
			vb.name = "box1"
			vb.memory = "512"
		end

		box1.vm.provision :shell, :path => "files/script_boxes_apt.sh"
	end
	
	config.vm.define "box2" do |box2|
		box2.vm.box = "centos/7"
	
		box2.vm.hostname = "box2.localdomain"
		box2.vm.network "public_network", ip: "10.0.0.12"

		box2.vm.provider "virtualbox" do |vb|
			vb.gui = false
			vb.name = "box2"
			vb.memory = "512"
		end

		box2.vm.provision :shell, :path => "files/script_boxes_yum.sh"
	end
	
	
end
