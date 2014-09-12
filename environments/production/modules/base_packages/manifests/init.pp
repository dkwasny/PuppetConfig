class base_packages {
	package { "vim-enhanced":
		ensure => present,
		allow_virtual => false
	}
	package { "wget":
		ensure => present,
		allow_virtual => false
	}
	package { "git":
		ensure => present,
		allow_virtual => false
	}
	package { "nmap-ncat":
		ensure => present,
		allow_virtual => false
	}
}
