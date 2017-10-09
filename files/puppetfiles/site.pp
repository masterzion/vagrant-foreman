# /etc/puppetlabs/code/environments/production/manifests/site.pp
# 
# Some usefull commands:
# On the server as root
# puppet parser validate site.pp
#


node box1.localdomain {
    notify { 'Applying box1.localdomain ': }
	include role::default
}

node box2.localdomain {
	include role::default
	include role::mysql_server
}