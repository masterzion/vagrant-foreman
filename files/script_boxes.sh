#!/bin/bash
echo "10.0.0.10   foreman.localdomain foreman" >> /etc/hosts
apt-get update
apt-get upgrade -y
apt install puppet-common -y
puppet agent --server foreman.localdomain --waitforcert 60 --test
/usr/bin/puppet agent --onetime --no-daemonize --splay --debug > /var/log/puppet.log 
puppet resource cron puppet-agent ensure=present user=root minute=5 command='/usr/bin/puppet agent --onetime --no-daemonize --splay --debug > /var/log/puppet.log '
apt-get install language-pack-pt -y
reboot