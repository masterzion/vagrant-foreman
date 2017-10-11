# /etc/puppetlabs/code/modules/profile/manifests/base.pp
class profile::base {
  notify { 'Applying base for ${::kernel} ': }
 
  # Include OS specific base profiles.
  case $::kernel {
    'Linux': {
		notify { 'Applying base profile': }
		class { 'motd':
			content => " Hostname ${::fqdn}. \n\n Running on os family  ${::osfamily} ( ${::operatingsystem} )!\n Useful commands: \n     sudo puppet agent --server foreman.localdomain --test\n     facter osfamily \n\n",
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

        case $::osfamily {
            'Debian': {
                        file { '/bin/puppet':
                            ensure => 'link',
                            target => '/usr/bin/puppet',
                        }
                      }
            'RedHat': {
                        file { '/bin/puppet':
                        
                            ensure => 'link',
                            target => '/opt/puppetlabs/bin/puppet',
                        }
                      }
            default: {
              fail ("puppet wont be present at /bin/puppet ")
            }
       }
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

