#!/bin/bash

# Update all the things and install puppet

sudo rpm -y update;
sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm;
sudo yum -y install puppet;
