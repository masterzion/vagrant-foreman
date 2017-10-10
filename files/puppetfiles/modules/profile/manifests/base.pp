# /etc/puppetlabs/code/modules/profile/manifests/base.pp



class profile::base {

  notify { 'Applying base for ${::kernel} ': }
  
  # Include OS specific base profiles.
  case $::kernel {
    'Linux': {
		notify { 'Applying base profile': }
		class { 'motd':
			content => " Hostname ${::fqdn}. \n\n Running on os family  ${::osfamily} ( ${::operatingsystem} )!\n Useful commands: \n     puppet agent --server foreman.localdomain --test\n     facter osfamily \n\n",
		}
		package { 'screen':
		   ensure => 'installed',
		}	
		package { 'wget':
		   ensure => 'installed',
		}
		package { 'nano':
		   ensure => 'installed',
		}
<<<<<<< HEAD
		
		package { 'wget':
		   ensure => 'installed',
		}
		
=======
        case $::osfamily {
            'Debian': {
                        file { '/usr/bin/puppet':
                            ensure => 'link',
                            target => '/bin/puppet',
                        }
                      }
            'RedHat': {
                        file { '/opt/puppetlabs/bin/puppet':
                        
                            ensure => 'link',
                            target => '/bin/puppet',
                        }
                      }
            default: {
              fail ("puppet wont be present at /bin/puppet ")
            }
       }
>>>>>>> d9a734e53418291c8023afcd25198fe6616988c3
    }
    'windows': {
      fail ("Kernel: ${::kernel} not supported in ${module_name}")
    }
    'JUNOS': {
      fail ("Kernel: ${::kernel} not supported in ${module_name}")
    }
    default: {
      fail ("Kernel: ${::kernel} not supported in ${module_name}")
    }
  }
}

