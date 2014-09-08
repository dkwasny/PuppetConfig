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
		owner => "hadoop",
		group => "hadoop",
		mode => 644
	} ->
	file { "/var/log/hadoop":
		ensure => "directory",
		owner => "hadoop",
		group => "hadoop",
		mode => 750
	} ->

	# Setup passwordless login for the hadoop user
	# which should of been created via the rpm.
	file { "/home/hadoop/.ssh":
		ensure => directory,
		owner => "hadoop",
		group => "hadoop",
		mode => 700,
	} ->
	file { "/home/hadoop/.ssh/authorized_keys":
		ensure => file,
		owner => "hadoop",
		group => "hadoop",
		mode => 600,
		source => "puppet:///modules/hadoop/home/hadoop/.ssh/authorized_keys",
	} ->
	file { "/home/hadoop/.ssh/id_rsa":
		ensure => file,
		owner => "hadoop",
		group => "hadoop",
		mode => 600,
		source => "puppet:///modules/hadoop/home/hadoop/.ssh/id_rsa",
	} ->
	file { "/home/hadoop/.ssh/id_rsa.pub":
		ensure => file,
		owner => "hadoop",
		group => "hadoop",
		mode => 644,
		source => "puppet:///modules/hadoop/home/hadoop/.ssh/id_rsa.pub",
	}
}
