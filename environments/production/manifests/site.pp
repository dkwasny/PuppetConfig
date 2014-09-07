node "puppet-test" {
	include iptables
	include base_packages
	include ntp_client
	include epel_packages
	include admin_user
	include java
	include hadoop
}
