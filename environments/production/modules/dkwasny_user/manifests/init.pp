class dkwasny_user {
	user { "dkwasny":
		name => "dkwasny",
		ensure => present,
		# Spoiler Alert: Password is "password"
		password => '$1$R9cfKHQC$xZecj706CMASpDNPwDkMY.',
		managehome => true
	}
	file { "/etc/sudoers.d/dkwasny":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 440,
		source => "puppet:///modules/dkwasny_user/etc/sudoers.d/dkwasny",
		require => User["dkwasny"]
	}
	file { "/home/dkwasny/.ssh":
		ensure => directory,
		owner => "dkwasny",
		group => "dkwasny",
		mode => 700,
		require => User["dkwasny"]
	}
	file { "/home/dkwasny/.ssh/authorized_keys":
		ensure => file,
		owner => "dkwasny",
		group => "dkwasny",
		mode => 600,
		source => "puppet:///modules/dkwasny_user/home/dkwasny/.ssh/authorized_keys",
		require => File["/home/dkwasny/.ssh"]
	}
	file { "/home/dkwasny/.ssh/id_rsa":
		ensure => file,
		owner => "dkwasny",
		group => "dkwasny",
		mode => 600,
		source => "puppet:///modules/dkwasny_user/home/dkwasny/.ssh/id_rsa",
		require => File["/home/dkwasny/.ssh"]
	}
	file { "/home/dkwasny/.ssh/id_rsa.pub":
		ensure => file,
		owner => "dkwasny",
		group => "dkwasny",
		mode => 644,
		source => "puppet:///modules/dkwasny_user/home/dkwasny/.ssh/id_rsa.pub",
		require => File["/home/dkwasny/.ssh"]
	}
	file { "/home/dkwasny/.vimrc":
		ensure => file,
		owner => "dkwasny",
		group => "dkwasny",
		mode => 664,
		source => "puppet:///modules/dkwasny_user/home/dkwasny/.vimrc",
		require => User["dkwasny"]
	}
	file { "/home/dkwasny/.tmux.conf":
		ensure => file,
		owner => "dkwasny",
		group => "dkwasny",
		mode => 664,
		source => "puppet:///modules/dkwasny_user/home/dkwasny/.tmux.conf",
		require => User["dkwasny"]
	}
}
