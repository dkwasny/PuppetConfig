class zookeeper ($quorum, $myid) {
	include java
	file { "/tmp/zookeeper-3.4.6-1.el7.centos.noarch.rpm":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		source => "puppet:///modules/zookeeper/zookeeper-3.4.6-1.el7.centos.noarch.rpm"
	} ->
	# The RPM will add the zookeeper user
	# and the appropriate systemd unit files.
	package { "zookeeper-3.4.6-1.el7.centos.noarch":
		ensure => present,
		provider => rpm,
		source => "/tmp/zookeeper-3.4.6-1.el7.centos.noarch.rpm",
		allow_virtual => false,
		require => Class["java"]
	} ->
	file { "/var/local/zookeeper":
		ensure => directory,
		owner => "zookeeper",
		group => "zookeeper",
		mode => 700
	} ->
	file { "/var/local/zookeeper/myid":
		ensure => file,
		owner => "zookeeper",
		group => "zookeeper",
		mode => 600,
		content => template("zookeeper/var/local/zookeeper/myid.erb")
	} ->
	file { "/usr/local/etc/zookeeper":
		ensure => directory,
		owner => "root",
		group => "root",
		mode => 644
	} ->
	file { "/usr/local/etc/zookeeper/zoo.cfg":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		content => template("zookeeper/usr/local/etc/zookeeper/zoo.cfg.erb")
	}
}
