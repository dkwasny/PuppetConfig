#!/bin/bash

sudo -u hadoop -E $(which start-dfs.sh);
sudo -u hadoop -E $(which start-yarn.sh);
