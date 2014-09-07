class ntp_client {
	package { "ntp":
		ensure => present,
		allow_virtual => false
	} ->
	file { "/etc/ntp.conf":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		source => "puppet:///modules/ntp_client/etc/ntp.conf",
	} ~>
	service { "ntpd":
		ensure => running,
		enable => true
	}
}
