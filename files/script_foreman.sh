#!/bin/bash


apt-get update
apt-get upgrade -y

apt-get -y install ca-certificates
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb

echo "deb http://deb.theforeman.org/ xenial 1.16" > /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 1.16" >> /etc/apt/sources.list.d/foreman.list
apt-get -y install ca-certificates
wget -q https://deb.theforeman.org/pubkey.gpg -O- | apt-key add -

apt-get install language-pack-pt

apt-get update && apt-get -y install foreman-installer

/usr/sbin/foreman-installer > /home/ubuntu/foreman.log

mv /home/ubuntu/foreman.log /etc/foreman

echo '#!/bin/sh' > /etc/update-motd.d/01-foreman
echo 'if [ -r /etc/foreman/foreman.log ] ; then '  >> /etc/update-motd.d/01-foreman
echo '#Foreman instalation description' >> /etc/update-motd.d/01-foreman
echo 'echo "==================================="' >> /etc/update-motd.d/01-foreman
echo 'echo "Foreman instalation description"' >> /etc/update-motd.d/01-foreman
echo 'tail -n 5 /etc/foreman/foreman.log' >> /etc/update-motd.d/01-foreman
echo 'echo "==================================="' >> /etc/update-motd.d/01-foreman
echo 'echo "To remove this information execute sudo rm /etc/foreman/foreman.log" ' >> /etc/update-motd.d/01-foreman
echo 'fi'  >> /etc/update-motd.d/01-foreman

puppet module install -i /etc/puppet/environments/production/modules puppetlabs/ntp

chmod +x /etc/update-motd.d/01-foreman

reboot

exit 0;
