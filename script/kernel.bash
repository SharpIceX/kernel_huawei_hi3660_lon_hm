#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source "./utils/setup_compiler.bash"

OUT="$OUT_DIR/kernel"
TMP_BIN_DIR="$TEMP_DIR/kernel/bin"
KERNEL_DIR="$PROJECT_DIR/kernel/kernel"

export ARCH="arm64"
export SUBARCH="arm64"
export CROSS_COMPILE="ccache aarch64-linux-android-"
export PATH="$PROJECT_DIR/gcc-4.9/bin:$TMP_BIN_DIR:$SUBMODULES_DIR/gcc-4.9/bin/:$PATH"

export KBUILD_BUILD_USER="SharpIce"
export KBUILD_BUILD_HOST="SharpIce"

rm -rf "$TMP_BIN_DIR"
mkdir -p "$OUT" "$TMP_BIN_DIR"

ln -sfT "$(command -v python2)" "$TMP_BIN_DIR/python"

cd "$KERNEL_DIR"

echo "正在配置内核"
make ARCH="$ARCH" \
     HOSTCC=gcc-11 \
     O="$OUT" \
     "merge_hi3660_defconfig"

echo "正在编译内核（使用 $NPROC 个核心）"
make ARCH="$ARCH" \
     O="$OUT" \
     HOSTCC=gcc-11 \
     HOSTCFLAGS="-fcommon" \
     KCFLAGS="-fno-pic" \
     WERROR=0 \
     -j"$NPROC"

echo "完成"
