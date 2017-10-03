# /etc/puppetlabs/code/environments/production/manifests/site.pp
# 
# Some usefull commands:
# On the server as root
# /bin/puppet module install -i /etc/puppetlabs/code/modules puppetlabs/mysql
# puppet parser validate site.pp
#
# on the client
# /usr/bin/puppet agent --server foreman.localdomain --test –trace
#

node box1.localdomain {
	notify { 'Applying class webapp': }

	class { 'motd':
		content => "Hello world!/n",
	}

	class { '::mysql::server':
		root_password           => 'EpamMysql',
		remove_default_accounts => true,
		override_options        => $override_options
	}
}
