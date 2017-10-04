#!/bin/bash
echo "10.0.0.10   foreman.localdomain foreman" >> /etc/hosts
yum update
yum upgrade -y
rpm -ivh  http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install puppet -y

/opt/puppetlabs/bin/puppet agent --enable
/opt/puppetlabs/bin/puppet agent --server foreman.localdomain --waitforcert 60 --test
/opt/puppetlabs/bin/puppet resource cron puppet-agent ensure=present user=root minute=5 command='/usr/bin/puppet agent -t --server foreman.localdomain  --debug > /var/log/puppet.log '

reboot 

exit 0;