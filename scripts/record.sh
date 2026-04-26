#!/bin/bash
DATA_DIR="/mnt/c/Users/27079/OneDrive/Desktop/perf-blackbox/data"
sudo perf record -a -g --switch-output --switch-timeout 60s -o $DATA_DIR/perf.data
