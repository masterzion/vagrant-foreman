# /etc/puppetlabs/code/modules/profile/manifests/mysql_server.pp

class profile::mysql_server {
	notify { 'Applying class DB': }


	class { '::mysql::server':
		root_password           => 'EpamMysql',
		remove_default_accounts => true,
		override_options        => $override_options
	}

}