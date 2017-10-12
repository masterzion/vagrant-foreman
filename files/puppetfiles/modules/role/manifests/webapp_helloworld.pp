class role::webapp_helloworld {
	include profile::java
	include profile::webapp
	include profile::webapp_helloworld
}