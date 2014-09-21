class ntp_client ($server_name) {
	package { "ntp":
		ensure => present,
		allow_virtual => false
	} ->
	package { "chrony":
		ensure => purged,
		allow_virtual => false
	} ->
	file { "/etc/ntp.conf":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		content => template("ntp_client/etc/ntp.conf.erb")
	} ~>
	service { "ntpd":
		ensure => running,
		enable => true
	}
}
