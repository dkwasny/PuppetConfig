node "puppet-test" {
	include firewalld
	include base_packages
	include ntp_client
	include epel_packages
	include admin_user
	include java
	include hadoop
}
