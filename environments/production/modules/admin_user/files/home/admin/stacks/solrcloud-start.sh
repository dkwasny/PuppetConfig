#!/bin/bash

echo "Starting hadoop";
/home/admin/stacks/hadoop-start.sh;
echo "Starting zookeeper";
/home/admin/daemons/zookeeper-start.sh;
echo "Starting solr";
/home/admin/daemons/solr-start.sh;
