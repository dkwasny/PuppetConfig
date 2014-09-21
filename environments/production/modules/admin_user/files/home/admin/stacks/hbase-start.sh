#!/bin/bash

echo "Starting hadoop";
/home/admin/stacks/hadoop-start.sh;
echo "Starting zookeeper";
/home/admin/daemons/zookeeper-start.sh;
echo "Starting hbase";
/home/admin/daemons/hbase-start.sh;
