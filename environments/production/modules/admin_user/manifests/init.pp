class admin_user {
	user { "admin":
		name => "admin",
		ensure => present,
		# Spoiler Alert: Password is "password"
		password => '$1$R9cfKHQC$xZecj706CMASpDNPwDkMY.',
		managehome => true
	} ->
	file { "/etc/sudoers.d/admin":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 440,
		source => "puppet:///modules/admin_user/etc/sudoers.d/admin",
	} ->
	file { "/home/admin/.ssh":
		ensure => directory,
		owner => "admin",
		group => "admin",
		mode => 700,
	} ->
	file { "/home/admin/.ssh/authorized_keys":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 600,
		source => "puppet:///modules/admin_user/home/admin/.ssh/authorized_keys",
	} ->
	file { "/home/admin/.ssh/id_rsa":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 600,
		source => "puppet:///modules/admin_user/home/admin/.ssh/id_rsa",
	} ->
	file { "/home/admin/.ssh/id_rsa.pub":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 644,
		source => "puppet:///modules/admin_user/home/admin/.ssh/id_rsa.pub",
	} ->
	file { "/home/admin/.vimrc":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 664,
		source => "puppet:///modules/admin_user/home/admin/.vimrc",
	} ->
	file { "/home/admin/.tmux.conf":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 664,
		source => "puppet:///modules/admin_user/home/admin/.tmux.conf",
	} ->
	file { "/home/admin/grid-start.sh":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 700,
		source => "puppet:///modules/admin_user/home/admin/grid-start.sh",
	} ->
	file { "/home/admin/grid-stop.sh":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 700,
		source => "puppet:///modules/admin_user/home/admin/grid-stop.sh",
	} ->
	file { "/home/admin/grid-format.sh":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 700,
		source => "puppet:///modules/admin_user/home/admin/grid-format.sh",
	}
}
