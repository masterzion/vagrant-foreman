# /etc/puppetlabs/code/modules/profile/manifests/webapp_helloworld.pp


class profile::webapp_helloworld {
	notify { "Applying class webapp_helloworld ": }
	
	user { 'helloworld':
		name => 'helloworld',
		ensure => 'present',
	}

	file { '/var/www/helloworld/':
		ensure => 'directory',
		recurse => true,
		owner => 'helloworld'
	}	
	
	maven { "/var/www/helloworld/":
	  id => "org.apache.maven:maven-core:3.2.5:jar",
	  repos => ["https://github.com/spring-guides/gs-serving-web-content.git"],
	  user => 'helloworld',
	}
}