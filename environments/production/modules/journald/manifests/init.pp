class journald {
	file { "/etc/systemd/journald.conf":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		source => "puppet:///modules/journald/etc/systemd/journald.conf"
	} ~>
	service { "journald":
	}
}
