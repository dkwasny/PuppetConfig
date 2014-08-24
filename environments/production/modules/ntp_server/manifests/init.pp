class ntp_server {
	package { "ntp":
		ensure => present,
		allow_virtual => false
	}
}
