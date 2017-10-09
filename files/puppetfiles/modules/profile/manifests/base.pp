# /etc/puppetlabs/code/modules/profile/manifests/base.pp

class profile::base {
    notify { 'Applying base profile': }
	class { 'motd':
		content => " Hostname ${::fqdn}. \n\n Running on os family  ${::osfamily} ( ${::operatingsystem} )!\n Useful commands: \n     puppet agent --server foreman.localdomain --test\n     facter osfamily \n\n",
	}
	
    package { 'screen':
       ensure => 'installed',
    }	
	 
    package { 'nano':
       ensure => 'installed',
    }	
}

