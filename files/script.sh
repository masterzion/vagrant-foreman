#!/bin/bash


apt-get update
apt-get upgrade -y

sudo apt-get install language-pack-pt

#echo "127.0.0.1  foreman.localdomain foreman   localhost" >> /etc/hosts
#echo "192.168.57.10   foreman.localdomain foreman  domain.domain.localhost foreman" >> /etc/hosts


apt-get -y install ca-certificates
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb

echo "deb http://deb.theforeman.org/ xenial 1.15" > /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 1.15" >> /etc/apt/sources.list.d/foreman.list
apt-get -y install ca-certificates
wget -q https://deb.theforeman.org/pubkey.gpg -O- | apt-key add -

apt-get install language-pack-pt

apt-get update && apt-get -y install foreman-installer

/usr/sbin/foreman-installer > /home/ubuntu/foreman.log

reboot

exit 0;
