class base_packages {
	package { "vim-enhanced":
		ensure => present,
		allow_virtual => false
	}
	package { "wget":
		ensure => present,
		allow_virtual => false
	}
	package { "man":
		ensure => present,
		allow_virtual => false
	}
	package { "ntp":
		ensure => present,
		allow_virtual => false
	}
	package { "git":
		ensure => present,
		allow_virtual => false
	}
}
