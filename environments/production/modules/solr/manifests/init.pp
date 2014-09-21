class solr {
	include java
	file { "/tmp/solr-4.10.0-1.el7.centos.noarch.rpm":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		source => "puppet:///modules/solr/solr-4.10.0-1.el7.centos.noarch.rpm"
	} ->
	# The RPM will add the solr user
	# and the appropriate systemd unit files.
	# This particular RPM also adds the appropriate
	# var directories
	package { "solr-4.10.0-1.el7.centos.noarch":
		ensure => present,
		provider => rpm,
		source => "/tmp/solr-4.10.0-1.el7.centos.noarch.rpm",
		allow_virtual => false,
		require => Class["java"]
	}
}
