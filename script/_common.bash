#!/usr/bin/env bash

set -euo pipefail

# 当前脚本所在目录
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
export SCRIPT_DIR

# 项目根目录
PROJECT_ROOT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
export PROJECT_ROOT_DIR

export PROJECT_DIR="${PROJECT_ROOT_DIR}/project" # 子项目目录
export SUBMODULES_DIR="${PROJECT_ROOT_DIR}/submodules" # 子模块目录
export CCACHE_DIR="$PROJECT_ROOT_DIR/.ccache" # ccache
export OUT_DIR="$PROJECT_ROOT_DIR/out" # 构建输出目录
export TEMP_DIR="$PROJECT_ROOT_DIR/.tmp" # 临时目录

mkdir -p "$CCACHE_DIR" "$OUT_DIR" "$TEMP_DIR"

ccache -M 10G
ccache -o compression=false
