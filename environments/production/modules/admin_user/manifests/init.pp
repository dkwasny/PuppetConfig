class admin_user(
	$namenode,
	$datanodes,
	$master,
	$regionservers,
	$zookeeper_quorum,
	$solr_nodes)
{
	define admin_script_template {
		file { "$title":
			ensure => file,
			owner => "admin",
			group => "admin",
			mode => 700,
			content => template("admin_user$title.erb")
		}
	}
	define admin_script_file {
		file { "$title":
			ensure => file,
			owner => "admin",
			group => "admin",
			mode => 700,
			source => "puppet:///modules/admin_user$title"
		}
	}

	user { "admin":
		name => "admin",
		ensure => present,
		# Spoiler Alert: Password is "password"
		password => '$1$R9cfKHQC$xZecj706CMASpDNPwDkMY.',
		managehome => true
	} ->
	file { "/etc/sudoers.d/admin":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 440,
		source => ("puppet:///modules/admin_user/etc/sudoers.d/admin")
	} ->
	file { "/home/admin/.ssh":
		ensure => directory,
		owner => "admin",
		group => "admin",
		mode => 700
	} ->
	file { "/home/admin/.ssh/authorized_keys":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 600,
		source => "puppet:///modules/admin_user/home/admin/.ssh/authorized_keys"
	} ->
	file { "/home/admin/.ssh/id_rsa":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 600,
		source => "puppet:///modules/admin_user/home/admin/.ssh/id_rsa"
	} ->
	file { "/home/admin/.ssh/id_rsa.pub":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 644,
		source => "puppet:///modules/admin_user/home/admin/.ssh/id_rsa.pub"
	} ->
	file { "/home/admin/.vimrc":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 664,
		source => "puppet:///modules/admin_user/home/admin/.vimrc"
	} ->
	file { "/home/admin/.vim":
		ensure => directory,
		owner => "admin",
		group => "admin",
		mode => 755,
	} ->
	file { "/home/admin/.vim/colors":
		ensure => directory,
		owner => "admin",
		group => "admin",
		mode => 755,
	} ->
	file { "/home/admin/.vim/colors/kdesert.vim":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 644,
		source => "puppet:///modules/admin_user/home/admin/.vim/colors/kdesert.vim"
	} ->
	file { "/home/admin/.tmux.conf":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 664,
		source => "puppet:///modules/admin_user/home/admin/.tmux.conf"
	} ->
	file { "/home/admin/hdfs-format.sh":
		ensure => file,
		owner => "admin",
		group => "admin",
		mode => 700,
		source => "puppet:///modules/admin_user/home/admin/hdfs-format.sh"
	} ->
	file { "/home/admin/daemons":
		ensure => directory,
		owner => "admin",
		group => "admin",
		mode => 700
	} ->
	admin_script_template { "/home/admin/daemons/hdfs-start.sh": } ->
	admin_script_template { "/home/admin/daemons/hdfs-stop.sh": } ->
	admin_script_template { "/home/admin/daemons/yarn-start.sh": } ->
	admin_script_template { "/home/admin/daemons/yarn-stop.sh": } ->
	admin_script_template { "/home/admin/daemons/zookeeper-start.sh": } ->
	admin_script_template { "/home/admin/daemons/zookeeper-stop.sh": } ->
	admin_script_template { "/home/admin/daemons/hbase-start.sh": } ->
	admin_script_template { "/home/admin/daemons/hbase-stop.sh": } ->
	admin_script_template { "/home/admin/daemons/solr-start.sh": } ->
	admin_script_template { "/home/admin/daemons/solr-stop.sh": } ->
	file { "/home/admin/stacks":
		ensure => directory,
		owner => "admin",
		group => "admin",
		mode => 700
	} ->
	admin_script_file { "/home/admin/stacks/hadoop-start.sh": } ->
	admin_script_file { "/home/admin/stacks/hadoop-stop.sh": } ->
	admin_script_file { "/home/admin/stacks/hbase-start.sh": } ->
	admin_script_file { "/home/admin/stacks/hbase-stop.sh": } ->
	admin_script_file { "/home/admin/stacks/solrcloud-start.sh": } ->
	admin_script_file { "/home/admin/stacks/solrcloud-stop.sh": } ->
	admin_script_file { "/home/admin/stacks/all-start.sh": } ->
	admin_script_file { "/home/admin/stacks/all-stop.sh": }
}
