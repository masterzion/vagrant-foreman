# /etc/puppetlabs/code/modules/profile/manifests/mysql_server.pp

class profile::mysql_server {
	notify { "Applying class DB $mysql_server ": }

# Run it in the server! ;)
# sudo puppet module install -i /etc/puppetlabs/code/modules puppetlabs/mysql

	class { '::mysql::server':
		root_password           => $mysql_root_pass,
		remove_default_accounts => true,
		override_options        => $override_options
	}

}