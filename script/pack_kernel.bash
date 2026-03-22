#!/usr/bin/env bash

set -euo pipefail

CMD_LINE="loglevel=5 initcall_debug=n page_tracker=on \
slub_min_objects=16 unmovable_isolate1=2:192M,3:224M,4:256M \
printktimer=0xfff0a000,0x534,0x538 androidboot.selinux=permissive \
buildvariant=user"

# shellcheck disable=SC1091
source "./utils/env.bash"

OUT="$OUT_DIR/kernel.img"

rm -f "$OUT"

python3 "$PROJECT_DIR"/kernel/kernel/tools/mkbootimg \
  --kernel "$OUT_DIR/kernel/arch/arm64/boot/Image.gz" \
  --base 0x0 \
  --kernel_offset 0x00080000 \
  --ramdisk_offset 0x07c00000 \
  --second_offset 0x00f00000 \
  --tags_offset 0x07a00000 \
  --pagesize 2048 \
  --header_version 1 \
  --os_version 9.0.0 \
  --os_patch_level 2020-10-01 \
  --cmdline "$CMD_LINE" \
  -o "$OUT"

echo "完成"