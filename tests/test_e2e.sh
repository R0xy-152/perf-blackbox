#!/bin/bash
# 完善的 E2E 测试脚本
LOG_FILE="/mnt/c/Users/27079/OneDrive/Desktop/perf-blackbox/logs/test.log"
mkdir -p /mnt/c/Users/27079/OneDrive/Desktop/perf-blackbox/logs

echo "[$(date)] 启动录制服务..." | tee -a $LOG_FILE
./bin/cpu-blackbox start
sleep 65

echo "[$(date)] 停止服务..." | tee -a $LOG_FILE
./bin/cpu-blackbox stop

echo "[$(date)] 查询生成火焰图..." | tee -a $LOG_FILE
./bin/cpu-blackbox query now test-report

if [ -f "/mnt/c/Users/27079/OneDrive/Desktop/test-report.svg" ]; then
    echo "SUCCESS: 火焰图已生成至桌面。"
else
    echo "ERROR: 火焰图生成失败。"
    exit 1
fi
