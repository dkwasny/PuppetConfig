#!/bin/bash

# Update all the things and install puppet

sudo yum -y install deltarpm;
sudo yum -y update;
sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm;
sudo yum -y install puppet;
