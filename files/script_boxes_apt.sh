#!/bin/bash
echo "10.0.0.10   foreman.localdomain foreman" >> /etc/hosts
apt-get update
apt-get upgrade -y
apt install puppet-common  language-pack-pt -y
puppet agent --enable
puppet agent --server foreman.localdomain --waitforcert 60 --test
puppet resource cron puppet-agent ensure=present user=root minute=5 command='/usr/bin/puppet agent -t --server foreman.localdomain  --debug > /var/log/puppet.log '

/usr/share/puppet agent --server foreman.localdomain --test

cd /etc/puppetlabs/puppet/
wget https://raw.githubusercontent.com/theforeman/puppet-foreman/master/files/foreman-report_v2.rb 

reboot 

exit 0;