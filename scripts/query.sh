#!/bin/bash
DATA_DIR="/mnt/c/Users/27079/OneDrive/Desktop/perf-blackbox/data"
FG_DIR="/mnt/c/Users/27079/OneDrive/Desktop/perf-blackbox/FlameGraph"
FILE=$(ls -t $DATA_DIR/perf.data.* | head -n 1)
sudo perf script -i $FILE | $FG_DIR/stackcollapse-perf.pl | $FG_DIR/flamegraph.pl > "/mnt/c/Users/27079/OneDrive/Desktop/$2.svg"
