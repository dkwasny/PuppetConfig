class chrony_server {
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
		source => "puppet:///modules/chrony_server/etc/chrony.conf"
	} ~>
	service { "chronyd":
		ensure => running,
		enable => true
	}
}
