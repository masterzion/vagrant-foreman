# /etc/puppetlabs/code/modules/profile/manifests/mysql_server.pp

class profile::mysql_server {
	notify { 'Applying class DB': }

<<<<<<< HEAD
# in puppet server
# sudo /bin/puppet module install -i /etc/puppetlabs/code/modules puppetlabs/mysql
=======
# Run it in the server! ;)
# /bin/puppet module install -i /etc/puppetlabs/code/modules puppetlabs/mysql
>>>>>>> d9a734e53418291c8023afcd25198fe6616988c3
#
	class { '::mysql::server':
		root_password           => 'EpamMysql',
		remove_default_accounts => true,
		override_options        => $override_options
	}

}