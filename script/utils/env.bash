#!/usr/bin/env bash

set -euo pipefail

# 当前脚本所在目录
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
export SCRIPT_DIR

# 项目根目录
PROJECT_ROOT_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
export PROJECT_ROOT_DIR

# 核心数
export NPROC=$(($(nproc) - 2))

export PROJECT_DIR="${PROJECT_ROOT_DIR}/project" # 子项目目录
export DATA_DIR="${PROJECT_ROOT_DIR}/data" # 设备原始数据目录
export SUBMODULES_DIR="${PROJECT_ROOT_DIR}/submodules" # 子模块目录
export OUT_DIR="$PROJECT_ROOT_DIR/out" # 构建输出目录
export TEMP_DIR="$PROJECT_ROOT_DIR/.tmp" # 临时目录

mkdir -p "$OUT_DIR" "$TEMP_DIR"
