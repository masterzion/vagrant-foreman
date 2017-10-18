# /etc/puppetlabs/code/modules/profile/manifests/webapp_helloworld.pp


class profile::webapp_helloworld {
	notify { "Applying class webapp_helloworld ": }
	
	user { 'myappuser':
		name => 'myappuser',
		ensure => 'present',
	}

	file { '/var/www/myapp/':
		ensure => 'directory',
		recurse => true,
		owner => 'myappuser'
	}	
	
	puppi::project::war { "myapp":
		source       => "http://repository.example42.com/myapp/myapp.war",
		user         => "myappuser",
		deploy_root  => "/var/www/myapp/",
		enable       => "true",
	}
	
	
	puppi::deploy { "Retrieve files":       # The $name of the define
		command  => "get_curl.sh",          # General-use script to use 
		priority => "40",                   # Execution order
		user     => "myappuser",            # Execution user
		project  => "myapp",                # The name of the project
	}
	
#	puppi::deploy
	
}