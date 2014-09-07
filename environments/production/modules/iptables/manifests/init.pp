class iptables {
	file { "/etc/sysconfig/iptables":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 600,
		source => "puppet:///modules/iptables/etc/sysconfig/iptables"
	} ~>
	service { "iptables":
		ensure => running
	}
}
