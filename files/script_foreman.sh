#!/bin/bash



apt-get -y install ca-certificates language-pack-pt
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb

echo "deb http://deb.theforeman.org/ xenial 1.16" > /etc/apt/sources.list.d/foreman.list
echo "deb http://deb.theforeman.org/ plugins 1.16" >> /etc/apt/sources.list.d/foreman.list
wget -q https://deb.theforeman.org/pubkey.gpg -O- | apt-key add -


apt-get update
apt-get upgrade -y

apt-get -y install ca-certificates foreman-installer

puppet cert --sign box1.localdomain


/usr/sbin/foreman-installer > /home/ubuntu/foreman.log

mv /home/ubuntu/foreman.log /etc/foreman

echo '#!/bin/sh' > /etc/update-motd.d/01-foreman
echo 'if [ -r /etc/foreman/foreman.log ] ; then '  >> /etc/update-motd.d/01-foreman
echo '#Foreman instalation description' >> /etc/update-motd.d/01-foreman
echo 'echo "==================================="' >> /etc/update-motd.d/01-foreman
echo 'echo "Foreman instalation description"' >> /etc/update-motd.d/01-foreman
echo 'tail -n 5 /etc/foreman/foreman.log' >> /etc/update-motd.d/01-foreman
echo 'echo "==================================="' >> /etc/update-motd.d/01-foreman
echo "echo '' " >> /etc/update-motd.d/01-foreman   >> /etc/update-motd.d/01-foreman
echo "echo 'Please type:'"  >> /etc/update-motd.d/01-foreman   >> /etc/update-motd.d/01-foreman
echo "echo 'sudo puppet cert --sign box1.localdomain'"  >> /etc/update-motd.d/01-foreman
echo "echo '' " >> /etc/update-motd.d/01-foreman   >> /etc/update-motd.d/01-foreman
echo 'echo "To remove this information execute sudo rm /etc/foreman/foreman.log" ' >> /etc/update-motd.d/01-foreman
echo 'fi'  >> /etc/update-motd.d/01-foreman 

chmod +x /etc/update-motd.d/01-foreman

echo "10.0.0.11   box1.localdomain box1" >> /etc/hosts
echo "10.0.0.12   box2.localdomain box2" >> /etc/hosts

ln -s /opt/puppetlabs/bin/puppet /bin/puppet 
ln -s /opt/puppetlabs/bin/facter /bin/facter

/bin/puppet module install -i /etc/puppetlabs/code/modules puppetlabs/ntp
/bin/puppet module install -i /etc/puppetlabs/code/modules puppetlabs-motd

reboot

exit 0;
