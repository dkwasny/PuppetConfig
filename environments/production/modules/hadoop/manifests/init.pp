class hadoop {
	include java

	file { "/tmp/hadoop-2.5.0-1.el6.i386.rpm":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		source => "puppet:///modules/hadoop/hadoop-2.5.0-1.el6.i386.rpm"
	} ->
	package { "hadoop-2.5.0-1.el6.i386":
		ensure => present,
		provider => rpm,
		source => "/tmp/hadoop-2.5.0-1.el6.i386.rpm",
		allow_virtual => false,
		require => Class["java"]
	} ->
	file { "/usr/local/etc/hadoop":
		ensure => "directory",
		owner => "root",
		group => "root",
		mode => 644,
		recurse => true,
		source => "puppet:///modules/hadoop/usr/local/etc/hadoop",
	} ->
	file { "/var/local/hadoop":
		ensure => "directory",
		owner => "root",
		group => "root",
		mode => 755,
	}
}
