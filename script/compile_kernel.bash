#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source "./_common.bash"

OUT="$OUT_DIR/kernel"
KERNEL_DIR="$PROJECT_DIR/kernel/kernel"

export ARCH="arm64"
export SUBARCH="arm64"
export CROSS_COMPILE="ccache $SUBMODULES_DIR/gcc-4.9/bin/aarch64-linux-android-"
export PATH="$SCRIPT_DIR/submodules/gcc-4.9/bin/:$PATH"

mkdir -p "$OUT"
cd "$KERNEL_DIR"

echo "正在配置内核"
make O="$OUT" "merge_hi3660_defconfig"

NPROC=$(($(nproc) + 1))
echo "正在编译内核（使用 $NPROC 个核心）"
make O="$OUT" \
     HOSTCC=gcc-11 \
     HOSTCFLAGS="-fcommon" \
     KCFLAGS="-fno-pic" \
     -j"$NPROC" \
     WERROR=0 \
     all

echo "完成"
