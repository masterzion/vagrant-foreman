# /etc/puppetlabs/code/modules/profile/manifests/java.pp

class profile::java {
	notify { "Applying java": }
	
	package { 'maven':
	   ensure => 'installed',
	}
	
	class { 'java':
	  distribution => 'jdk',
	}

}