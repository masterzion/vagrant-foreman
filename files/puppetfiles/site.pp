# /etc/puppetlabs/code/environments/production/manifests/site.pp
# 
# Some usefull commands:
# On the server as root
# /bin/puppet module install -i /etc/puppetlabs/code/modules puppetlabs/mysql
# puppet parser validate site.pp
#


node box1.localdomain {
	include role::default
}

node box2.localdomain {
	include role::default
	include role::mysql_server
}