class chrony_client ($server_name) {
	package { "chrony":
		ensure => present,
		allow_virtual => false
	} ->
	package { "ntp":
		ensure => purged,
		allow_virtual => false
	} ->
	file { "/etc/chrony.conf":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		content => template("chrony_client/etc/chrony.conf.erb")
	} ~>
	service { "chronyd":
		ensure => running,
		enable => true
	}
} 
