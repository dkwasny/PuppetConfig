#!/bin/bash

sudo -u hdfs -E $(which start-dfs.sh);
sudo -u yarn -E $(which start-yarn.sh);
