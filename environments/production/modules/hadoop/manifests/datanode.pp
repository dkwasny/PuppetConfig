class hadoop::datanode {
	include hadoop::base

	service { "hdfs-datanode":
		enable => true,
		# This subscription will have cause a restart
		# whenever the config files change, so watch out!
		subscribe => Class["hadoop::base"],
		require => Class["hadoop::base"]
	} ->
	service { "yarn-nodemanager":
		enable => true,
		subscribe => Class["hadoop::base"]
	}
}
