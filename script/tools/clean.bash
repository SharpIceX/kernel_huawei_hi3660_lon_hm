#!/usr/bin/env bash

set -euo pipefail

# shellcheck disable=SC1091
source "../utils/env.bash"

rm -rf "$OUT_DIR"

##################################################

if [ -d "$SUBMODULES_DIR/Magisk" ]; then
    (cd "$SUBMODULES_DIR/Magisk" && python3 "./build.py" clean native)
else
    echo "跳过 Magisk：目录不存在"
fi

##################################################

echo "完成"
