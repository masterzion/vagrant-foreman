# /etc/puppetlabs/code/modules/role/manifests/mysql_server.pp

class role::mysql_server {
	include profile::mysql_server
	include profile::java
}