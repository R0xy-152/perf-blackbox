# Perf-Blackbox: Linux 持续性能分析系统

一个基于 `perf` 的 7*24 小时 CPU 性能监控与回溯系统，旨在像行车记录仪一样，在事故发生后通过时间戳生成 CPU 火焰图。

## 架构设计
- **录制层**: 使用 `perf` 原生滚动功能，每 60 秒切片一次 `.data` 文件。
- **查询层**: 自动解析指定时间切片，结合 FlameGraph 工具链生成可视化 SVG。
- **控制层**: `cpu-blackbox` 单一入口，集成 start/stop/status/query 功能。

## 目录结构
- `/bin/`: 控制逻辑 `cpu-blackbox`
- `/scripts/`: 核心流程 `record.sh`, `query.sh`
- `/data/`: 性能数据切片
- `/FlameGraph/`: Brendan Gregg 的火焰图工具集
- `/tests/`: 自动化测试脚本

## 快速上手
1. 启动录制: `sudo ./bin/cpu-blackbox start`
2. 停止录制: `sudo ./bin/cpu-blackbox stop`
3. 查询生成: `./bin/cpu-blackbox query <关键字> <文件名>`
4. 运行测试: `./tests/test_e2e.sh`

## 环境要求
- Linux (WSL2 需内核支持 perf)
- `perf`, `sqlite3`, `perl`
