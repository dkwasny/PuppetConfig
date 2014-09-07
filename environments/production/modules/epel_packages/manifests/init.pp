class epel_packages {
	package { "epel-release-6-8.noarch":
		ensure => present,
		provider => rpm,
		source => "http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm",
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
