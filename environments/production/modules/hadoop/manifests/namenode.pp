class hadoop::namenode {
	include hadoop::base

	service { "hdfs-namenode":
		enable => true,
		# This subscription will have cause a restart
		# whenever the config files change, so watch out!
		subscribe => Class["hadoop::base"],
		require => Class["hadoop::base"]
	} ->
	service { "hdfs-secondarynamenode":
		enable => true,
		subscribe => Class["hadoop::base"],
	} ->
	service { "yarn-resourcemanager":
		enable => true,
		subscribe => Class["hadoop::base"]
	} ->
	service { "yarn-mrhistoryserver":
		enable => true,
		subscribe => Class["hadoop::base"]
	}
}
