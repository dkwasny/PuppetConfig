class hbase::master {
	include hbase::base

	service { "hbase-master":
		enable => true,
		# This subscription will have cause a restart
		# whenever the config files change, so watch out!
		subscribe => Class["hbase::base"],
		require => Class["hbase::base"]
	}
}
