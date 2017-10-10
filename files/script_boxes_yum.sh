#!/bin/bash
echo "10.0.0.10   foreman.localdomain foreman" >> /etc/hosts
yum update
yum upgrade -y
rpm -ivh  http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install puppet -y
find /etc/puppetlabs/puppet/ssl -name box2.localdomain.pem -delete
/opt/puppetlabs/bin/puppet agent --enable
/opt/puppetlabs/bin/puppet agent --server foreman.localdomain --waitforcert 10 --test
/opt/puppetlabs/bin/puppet resource cron puppet-agent ensure=present user=root minute=5 command='/usr/bin/puppet agent -t --server foreman.localdomain  --debug > /var/log/puppet.log '

<<<<<<< HEAD
=======

/opt/puppetlabs/bin/puppet  agent --server foreman.localdomain --test


cd /etc/puppetlabs/puppet/
wget https://raw.githubusercontent.com/theforeman/puppet-foreman/master/files/foreman-report_v2.rb 


>>>>>>> d9a734e53418291c8023afcd25198fe6616988c3
reboot 

exit 0;