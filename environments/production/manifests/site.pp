node "puppet-test" {
	include iptables
	include base_packages
	include epel_packages
	include dkwasny_user
}
