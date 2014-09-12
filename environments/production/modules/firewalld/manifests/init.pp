class firewalld {
	file { "/etc/firewalld/firewalld.conf":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 600,
		source => "puppet:///modules/firewalld/etc/firewalld/firewalld.conf"
	} ->
	file { "/etc/firewalld/zones":
		ensure => directory,
		owner => "root",
		group => "root",
		mode => 750,
		recurse => true,
		purge => true,
		source => "puppet:///modules/firewalld/etc/firewalld/zones"
	} ~>
	service { "firewalld":
		ensure => running
	}	
}
