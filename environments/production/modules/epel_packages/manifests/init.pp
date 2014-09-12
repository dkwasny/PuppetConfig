class epel_packages {
	package { "epel-release-7-1.noarch":
		ensure => present,
		provider => rpm,
		source => "http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-1.noarch.rpm",
		allow_virtual => false
	} ->
	package { "htop":
		ensure => present,
		allow_virtual => false,
	} ->
	package { "tmux":
		ensure => present,
		allow_virtual => false,
	}
}
