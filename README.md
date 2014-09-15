PuppetConfig
============

An expanded reimplementation of [VMGridTools](https://github.com/dkwasny/VMGridTools) with Puppet instead of complete homerolled nastiness.
This setup is intended for 64-bit CentOS 7 minimal machines, but should be usable with more fully featured Centos 7 releases.
I would not be surprised if this works with Fedora as well.

Any non-RHEL distros will have some pain because of my usage of the EPEL repo.
The setup_agent.sh script is also RHEL/Centos 7 specific.
Both of these problems should be easily solvable if the need arises (unlikely on my own).
Supporting SysVinit is not currently planned (puts up flame shield).

The firewalld configuration opens ALL traffic from 192.168.1.0/24 while dropping ALL OTHER traffic.

I don't have a good way to start or stop the entire grid via a command.
I rely on the init system to start all the appropriate daemons for me and puppet to restart everything when things change.

How to Use
------------
1. Setup a server named **puppet** that will become your puppet master.
 * If you name the server something other than **puppet** then you will need to configre your puppet agents to look for that server.
1. Install the **puppet-server** package from the appropriate [Puppet repo](https://docs.puppetlabs.com/guides/puppetlabs_package_repositories.html) to your puppet master.
1. Setup your puppet master and point it to a clone of this repo for configuration.
 * I just add a symlink from /etc/puppet to wherever I checked out the repo (in my home directory).
1. Start the **puppetmaster** daemon.
1. Add any .rpm files to the repo where a .goeshere marker file already exists.
 * See below for more information.
1. Setup however many servers you want that will become your puppet agents.
1. Copy and run setup_agent.sh on your puppet agents.
 * This should perform a full yum update and install the **puppet** repo and package.
1. Create YAML files for your puppet agents in [PuppetConfig/hieradata](https://github.com/dkwasny/PuppetConfig/tree/master/hieradata).
 * There should be useful example files already in there.
 * The filename is typically **\<FQDN\>.yaml**.
 * Per [hiera.yaml](https://github.com/dkwasny/PuppetConfig/blob/master/hiera.yaml), I am REALLY using the "Puppet Client Cert Name", but so far that has always been the FQDN.
1. Run **puppet agent --no-daemonize --verbose --noop** on your puppet agents to trigger your cert requests.
 * You may need to adjust your firewall settings to allow the traffic through.
 * Like the settings within this repo, I just open all 192.168.1.0/24 traffic to the puppet master.
1. Verify the cert requests made it to your puppet master by running **sudo puppet cert list --all** on your puppet master.
1. Accept each cert request by running **sudo puppet cert sign \<SERVER_NAME\>**.
 * You can use **--all** instead of **\<SERVER_NAME\>** if you want.
1. Again, run **puppet agent --no-daemonize --verbose --noop** and see the list of changes that will be applied.
1. Once you are satisfied with the **--noop** output, run **puppet agent --no-daemonize --verbose** to start the real deal.
 * This takes about ~240 seconds for me.
1. SSH over to **admin@\<NAMENODE\>** (password is *password*) and run **grid-format.sh** to setup your new namenode.
 * If you skip this step, all hell will break loose when you try to start your grid.
 * I can't really think of a good way to automate this because it will nuke all existing HDFS data.
1. Either start up all of the appropriate daemons yourself, or just restart the machines.
 * The daemons should be run on machine startup.
 * See below for more information on the daemons.

Daemons
-----------
To operate on a daemon, execute **sudo systemctl \<start|stop|status\> \<DAEMON_NAME\>**.
Because of how I use systemd to manage daemons, most all daemon logs will end up in systemd's journal instead of being separate files in /var/log.
To read the logs for a particular daemon, execute **sudo journalctl -u \<DAEMON_NAME\>**.
Here is a list of all installed daemons.
* hdfs-namenode
* hdfs-datanode
* yarn-resourcemanager
* yarn-nodemanager
* yarn-mrhistoryserver
 * This is really for MapReduce, but I'm rolling it up with the other yarn daemons.

.goeshere Files
-----------
There are files in the repo with a suffix of **.goeshere**.
This files are markers meant to tell you that the real file "goes here".
These files are just too big to be reasonably stored in a GitHub repo, and can be found on [Google Drive](https://drive.google.com/folderview?id=0BxpgL9f7eLyfUHhqWlRtRHRQS28&usp=sharing).

Custom RPM Files
-----------
I will be creating my own RPMs unless I am able to find one of the latest version.
You can find the **.spec** and systemd **.service ** files for these RPMs in [SpecFiles](https://github.com/dkwasny/SpecFiles).
The binaries within the provided RPMs may be compiled from source if the released binaries do not fit my needs.
