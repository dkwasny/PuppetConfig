class system-config {
	file { "/etc/sysconfig/iptables":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 600,
		source => "puppet:///modules/system-config/etc/sysconfig/iptables"
	}
}
