node "puppet-test" {
	include system-config
	include base-packages
	include epel-packages
	include dkwasny-user
}
