# /etc/puppetlabs/code/modules/profile/manifests/mysql_server.pp

class profile::mysql_server {
	notify { 'Applying class DB': }

# in puppet server
# sudo /bin/puppet module install -i /etc/puppetlabs/code/modules puppetlabs/mysql
#
#	class { '::mysql::server':
#		root_password           => 'EpamMysql',
#		remove_default_accounts => true,
#		override_options        => $override_options
#	}

}