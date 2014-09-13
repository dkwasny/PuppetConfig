#!/bin/bash

sudo -u yarn -E $(which stop-yarn.sh);
sudo -u hdfs -E $(which stop-dfs.sh);
