# Perf-Blackbox: Linux 持续性能分析系统

## 1. 是什么
Perf-Blackbox 是一个基于 Linux `perf` 的 7*24 小时 CPU 性能监控与回溯系统，像行车记录仪一样记录系统性能数据，支持在事故发生后秒级回溯并生成 CPU 火焰图。

## 2. 怎么装
### 环境依赖
确保系统安装了以下基础工具：
```bash
sudo apt install perf linux-tools-common linux-tools-generic perl sqlite3
```

### 部署步骤
1. 克隆项目与依赖：
   ```bash
   git clone https://github.com/R0xy-152/perf-blackbox.git
   cd perf-blackbox
   # 若 FlameGraph 缺失，可手动克隆：
   git clone https://github.com/brendangrep/FlameGraph.git
   ```
2. 赋予权限：
   ```bash
   chmod +x bin/cpu-blackbox scripts/*.sh tests/*.sh
   ```

## 3. 怎么用
### 启动录制
```bash
sudo ./bin/cpu-blackbox start
```

### 查看状态
```bash
sudo ./bin/cpu-blackbox status
```

### 查询并回溯
```bash
./bin/cpu-blackbox query now incident_report
```

## 4. 设计要点
- **为什么用 --switch-output**：利用 `perf` 原生滚动功能，避免手动处理 Ring Buffer 溢出，确保录制的高吞吐与原子性。
- **为什么 60 秒一片**：60 秒是性能粒度与磁盘 IO 的平衡点，既能捕捉瞬间抖动，又避免了频繁切换导致的数据碎裂。
- **磁盘占用估算**：默认单次录制约 4-5MB/min，24 小时约占用 6-7GB 空间。

## 5. 测试结果
```text
测试结果暂未记录。
```

## 6. 已知限制
- **内核版本**：需 Linux Kernel 4.x+ 且支持 `perf record --switch-output` 参数。
- **权限**：持续录制必须拥有 `root` 权限。
- **WSL 适配**：在 WSL2 中需确认内核已启用 `perf_event` 支持，部分低版本内核可能无法读取完整调用栈。
