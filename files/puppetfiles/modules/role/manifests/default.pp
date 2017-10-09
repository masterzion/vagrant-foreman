# /etc/puppetlabs/code/modules/role/manifests/default.pp

class role::default {
     notify { 'Applying default ': }
	include profile::base
}