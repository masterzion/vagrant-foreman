class profile::webapp {
	notify { "Applying class webapp ": }
	file { '/var/www/':
		ensure => 'directory',
		recurse => true,
	}		

}