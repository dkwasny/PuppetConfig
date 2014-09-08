#!/bin/bash

sudo -u hadoop -E $(which hdfs) namenode -format;
