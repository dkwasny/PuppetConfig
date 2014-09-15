class hadoop::base ($namenode, $datanodes) {
	include java

	file { "/tmp/hadoop-2.5.1-1.el7.centos.x86_64.rpm":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		source => "puppet:///modules/hadoop/hadoop-2.5.1-1.el7.centos.x86_64.rpm"
	} ->
	# The RPM will add the hdfs and yarn users
	# and the appropriate systemd unit files.
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
	file { "/usr/local/etc/hadoop/core-site.xml":
		ensure => "file",
		owner => "root",
		group => "root",
		mode => 644,
		content => template("hadoop/usr/local/etc/hadoop/core-site.xml.erb")
	} ->
	file { "/usr/local/etc/hadoop/hdfs-site.xml":
		ensure => "file",
		owner => "root",
		group => "root",
		mode => 644,
		content => template("hadoop/usr/local/etc/hadoop/hdfs-site.xml.erb")
	} ->
	file { "/usr/local/etc/hadoop/slaves":
		ensure => "file",
		owner => "root",
		group => "root",
		mode => 644,
		content => template("hadoop/usr/local/etc/hadoop/slaves.erb")
	} ->
	file { "/usr/local/etc/hadoop/yarn-site.xml":
		ensure => "file",
		owner => "root",
		group => "root",
		mode => 644,
		content => template("hadoop/usr/local/etc/hadoop/yarn-site.xml.erb")
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
