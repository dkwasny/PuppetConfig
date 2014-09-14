class hadoop::namenode {
	include hadoop::base

	service { "hadoop-namenode":
		enable => true,
		# This subscription will have cause a restart
		# whenever the config files change, so watch out!
		subscribe => File["/usr/local/etc/hadoop"],
		require => Class["hadoop::base"]
	} ->
	service { "yarn-resourcemanager":
		enable => true,
		subscribe => File["/usr/local/etc/hadoop"]
	} ->
	service { "yarn-mrhistoryserver":
		enable => true,
		subscribe => File["/usr/local/etc/hadoop"]
	}
}
