#!/bin/bash

echo "Stopping solr";
/home/admin/daemons/solr-stop.sh;
echo "Stopping hbase";
/home/admin/daemons/hbase-stop.sh;
echo "Stopping zookeeper";
/home/admin/daemons/zookeeper-stop.sh;
echo "Stopping hadoop";
/home/admin/stacks/hadoop-stop.sh;
