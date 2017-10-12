# /etc/puppetlabs/code/environments/production/manifests/site.pp
# 
# Some usefull commands:
# On the server as root
# puppet parser validate site.pp
#


node box1.localdomain {
    notify { 'Applying box1.localdomain ': }
	include role::default
# Run this command in the server:	
#  sudo puppet module install -i /etc/puppetlabs/code/modules  puppetlabs-java
#  sudo puppet module install -i /etc/puppetlabs/code/modules maestrodev-maven 
	include role::webapp_helloworld
}

node box2.localdomain {
	include role::default
	include role::mysql_server
}