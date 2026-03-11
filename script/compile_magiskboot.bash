#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source "./_common.bash"

OUT="$OUT_DIR/magiskboot"
MAGISK_DIR="$SUBMODULES_DIR/Magisk"

export NDK_CCACHE=ccache
export ANDROID_HOME="$TEMP_DIR/mgaisk/android_sdk"

rm -rf "$OUT"
mkdir -p "$OUT" "$ANDROID_HOME"

cd "$MAGISK_DIR"

echo "检查 ONDK"
if [ ! -d "$ANDROID_HOME/ndk/magisk" ]; then
    echo "初始化 ONDK"
    python3 "./build.py" -v -r ndk
fi

echo "编译 Magisk Boot"
python3 "./build.py" -v -r native magiskboot

echo "复制编译结果"
cp "./native/out/x86_64/magiskboot" "$OUT"

echo "完成"