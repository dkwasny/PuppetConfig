class hadoop::datanode {
	include hadoop::base

	service { "hadoop-datanode":
		enable => true,
		# This subscription will have cause a restart
		# whenever the config files change, so watch out!
		subscribe => File["/usr/local/etc/hadoop"],
		require => Class["hadoop::base"]
	} ->
	service { "yarn-nodemanager":
		enable => true,
		subscribe => File["/usr/local/etc/hadoop"]
	}
}
