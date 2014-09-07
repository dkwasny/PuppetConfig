class ntp_server {
	package { "ntp":
		ensure => present,
		allow_virtual => false
	}
	file { "/etc/ntp.conf":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		source => "puppet:///modules/ntp_server/etc/ntp.conf",
		require => Package["ntp"]
	}
	service { "ntpd":
		ensure => running,
		require => File["/etc/ntp.conf"]
	}
}
