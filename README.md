# Vagrant - Foreman

A Vagrant script which starts a VM in Virtualbox and installs reqiurements / tools for foreman 1.10. 

#### Requirements 

* VirtualBox latest.
* Vagrant latest. 
* Vagrant-Ubuntu-Box

#### How-To

* Download the repo with ```git clone https://github.com/masterzion/vagrant-foreman```
* Change the values in "Vagrantfile" and "files/script.sh" regarding to your network
* vagrant up

This will spawn a Ubuntu-Virtual-Machine and will install all needed tools & dependencies for Foreman.

The information regarding the instalation will be present in the "message of the day" showed after the login