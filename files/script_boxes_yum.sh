#!/bin/bash
echo "10.0.0.10   foreman.localdomain foreman" >> /etc/hosts
yum update
yum upgrade -y
rpm -ivh  http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install puppet -y

/opt/puppetlabs/bin/puppet agent --enable
/opt/puppetlabs/bin/puppet agent --server foreman.localdomain --waitforcert 10 --test
/opt/puppetlabs/bin/puppet resource cron puppet-agent ensure=present user=root minute=5 command='/usr/bin/puppet agent -t --server foreman.localdomain  --debug > /var/log/puppet.log '


/opt/puppetlabs/bin/puppet  agent --server foreman.localdomain --test


cd /etc/puppetlabs/puppet/
wget https://raw.githubusercontent.com/theforeman/puppet-foreman/master/files/foreman-report_v2.rb 


reboot 

exit 0;