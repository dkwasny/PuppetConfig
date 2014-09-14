class hadoop::base {
	include java

	file { "/tmp/hadoop-2.5.1-1.el7.centos.x86_64.rpm":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		source => "puppet:///modules/hadoop/hadoop-2.5.1-1.el7.centos.x86_64.rpm"
	} ->
	# The RPM will add the hdfs and yarn users
	package { "hadoop-2.5.1-1.el7.centos.x86_64":
		ensure => present,
		provider => rpm,
		source => "/tmp/hadoop-2.5.1-1.el7.centos.x86_64.rpm",
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
	file { [
		"/var/local/hdfs",
		"/var/local/hdfs/name",
		"/var/local/hdfs/data",
		"/var/log/hdfs"
		]:
		ensure => "directory",
		owner => "hdfs",
		group => "hdfs",
		mode => 700
	} ->
	file { "/var/log/yarn":
		ensure => "directory",
		owner => "yarn",
		group => "yarn",
		mode => 700
	}
}
