node "puppet-test" {
	include iptables
	include base_packages
	include ntp_client
	include epel_packages
	include dkwasny_user
}
