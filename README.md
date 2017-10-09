# Vagrant - Foreman

A Vagrant script which starts a VM in Virtualbox and installs reqiurements / tools for foreman 1.16. 

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

PS: tested with Vagrant 2.0 and virtualbox 5.1.28


#### References: 

https://docs.puppet.com/puppet/5.2/modules_fundamentals.html

https://www.example42.com/tutorials/PuppetTutorial/#slide-12

https://youtu.be/4HkRTY4q1rk?t=2m59s

https://www.digitalocean.com/community/tutorials/how-to-create-a-puppet-module-to-automate-wordpress-installation-on-ubuntu-14-04

https://docs.puppet.com/puppet/5.2/lang_facts_and_builtin_vars.html

https://docs.puppet.com/facter/latest/core_facts.html

https://www.youtube.com/watch?v=RYMNmfM6UHw

https://www.udemy.com/introduction-to-puppet-roles-and-profiles
