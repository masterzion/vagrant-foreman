# /etc/puppetlabs/code/modules/profile/manifests/webapp_helloworld.pp


class profile::webapp_helloworld {
	notify { "Applying class webapp_helloworld ": }
	
	
	maven { "/var/www":
#	  id => "groupId:artifactId:version:packaging:classifier",
	  repos => ["id::layout::https://github.com/spring-guides/gs-serving-web-content.git"],
	  
	}
}