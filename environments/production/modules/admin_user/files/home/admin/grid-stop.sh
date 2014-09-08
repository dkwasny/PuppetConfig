#!/bin/bash

sudo -u hadoop -E $(which stop-yarn.sh);
sudo -u hadoop -E $(which stop-dfs.sh);
