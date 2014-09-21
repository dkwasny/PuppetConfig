#!/bin/bash

echo "Stopping hbase";
/home/admin/daemons/hbase-stop.sh;
echo "Stopping zookeeper";
/home/admin/daemons/zookeeper-stop.sh;
echo "Stopping hadoop";
/home/admin/stacks/hadoop-stop.sh;
