PuppetConfig
============

An expanded reimplementation of my VMGridTools project with Puppet instead of complete homerolled nastiness.
This setup is intended for 32-bit CentOS 6 machines.
I plan to move to CentOS 7 once a 32-bit version is released.
My desire to use a 32-bit OS is purely fueled by saving memory so I can have more nodes up at one time.

Currently, the site.pp manifest is only looking for a single server called puppet-test.
Once I finish getting all of the appropriate daemons working, I will look into making this a bit more robust.

The below tutorial assumes you already have knowledge on how to setup a puppet master.
I will eventually add some bullets on how to setup a usable puppet master.

How to Use
------------
1. Setup your puppet master and point it to a clone of this repo for configuration.
1. Add any .rpm files to the repo where a .goeshere marker file already exists.
 * See below for more information.
1. Get your puppet agent (named puppet-test) connected to the internet.
1. Run setup_agent.sh on your puppet agent.
 * This will execute a full yum update, install the Puppet repo and pull down the latest version of Puppet.
 * This means adding new nodes should follow a full yum update on your existing nodes (who needs stability on a toy grid?).
1. Have your puppet agent sync up with the puppet master.
1. Switch over to the newly created **admin** user (password is *password*).
1. If this node is a brand new Hadoop namenode, then run **grid-format.sh** in the admin user's home directory.
1. Run **grid-start.sh** to start up your new 1 node grid!
1. Stop all grid daemons by running **grid-stop.sh**.

.goeshere Files
-----------
There are files in the repo with a suffix of **.goeshere**.
This files are markers meant to tell you that the real file "goes here".
These files are just too big to be reasonably stored in a GitHub repo, and can be found on [Google Drive](https://drive.google.com/folderview?id=0BxpgL9f7eLyfUHhqWlRtRHRQS28&usp=sharing).

Custom RPM Files
-----------
I will be creating my own RPMs unless I am able to find one of the latest version.
You can find the **.spec** files for these RPMs in [SpecFiles](https://github.com/dkwasny/SpecFiles).
The binaries within the provided RPMs may be compiled from source if the released binaries do not fit my needs.

Misc Notes
-----------
Hadoop 2.5.0 is the first Hadoop release I know of to ship with 64-bit native libraries, so I had to compile a 32-bit version of source.
