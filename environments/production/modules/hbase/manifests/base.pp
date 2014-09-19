class hbase::base ($namenode, $regionservers, $zookeeper_quorum) {
	include hadoop

	file { "/tmp/hbase-0.98.6.1-1.el7.centos.x86_64.rpm":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		source => "puppet:///modules/hbase/hbase-0.98.6.1-1.el7.centos.x86_64.rpm"
	} ->
	# The RPM will add the hbase user
	# and the appropriate systemd unit files.
	package { "hbase-0.98.6.1-1.el7.centos.x86_64":
		ensure => present,
		provider => rpm,
		source => "/tmp/hbase-0.98.6.1-1.el7.centos.x86_64.rpm",
		allow_virtual => false,
		require => Class["hadoop::base"]
	} ->
	file { "/usr/local/etc/hbase":
		ensure => directory,
		owner => "root",
		group => "root",
		mode => 644,
		recurse => true,
		source => "puppet:///modules/hbase/usr/local/etc/hbase",
	} ->
	file { "/usr/local/etc/hbase/hbase-site.xml":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		content => template("hbase/usr/local/etc/hbase/hbase-site.xml.erb")
	} ->
	file { "/usr/local/etc/hbase/regionservers":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		content => template("hbase/usr/local/etc/hbase/regionservers.erb")
	} ->
	file { [
		"/var/local/hbase",
		"/var/local/hbase/local",
		"/var/local/hbase/tmp",
		"/var/log/hbase"
		]:
		ensure => directory,
		owner => "hbase",
		group => "hbase",
		mode => 700
	}
}
