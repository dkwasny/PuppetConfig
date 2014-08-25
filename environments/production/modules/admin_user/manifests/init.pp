class admin_user {
	user { "admin":
		name => "admin",
		ensure => present,
		# Spoiler Alert: Password is "password"
		password => '$1$R9cfKHQC$xZecj706CMASpDNPwDkMY.',
		managehome => true
	}
	file { "/etc/sudoers.d/admin":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 440,
		source => "puppet:///modules/admin_user/etc/sudoers.d/admin",
		require => User["admin"]
	}
	file { "/home/admin/.ssh":
		ensure => directory,
		owner => "admin",
		group => "admin",
		mode => 700,
		require => User["admin"]
	}
	file { "/home/admin/.ssh/authorized_keys":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 600,
		source => "puppet:///modules/admin_user/home/admin/.ssh/authorized_keys",
		require => File["/home/admin/.ssh"]
	}
	file { "/home/admin/.ssh/id_rsa":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 600,
		source => "puppet:///modules/admin_user/home/admin/.ssh/id_rsa",
		require => File["/home/admin/.ssh"]
	}
	file { "/home/admin/.ssh/id_rsa.pub":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 644,
		source => "puppet:///modules/admin_user/home/admin/.ssh/id_rsa.pub",
		require => File["/home/admin/.ssh"]
	}
	file { "/home/admin/.vimrc":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 664,
		source => "puppet:///modules/admin_user/home/admin/.vimrc",
		require => User["admin"]
	}
	file { "/home/admin/.tmux.conf":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 664,
		source => "puppet:///modules/admin_user/home/admin/.tmux.conf",
		require => User["admin"]
	}
}
