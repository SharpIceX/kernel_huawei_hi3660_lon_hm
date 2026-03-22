#!/usr/bin/env bash

set -euo pipefail

# 当前脚本所在目录
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

# shellcheck disable=SC1091
source "$SCRIPT_DIR/env.bash"

# ccache
export CCACHE_HARDLINK="true"
export CCACHE_NOHASHDIR="true"
export CCACHE_DIR="$PROJECT_ROOT_DIR/.ccache" # ccache
export CCACHE_COMPILERCHECK="%compiler% -dumpmachine; %compiler% -dumpversion"
mkdir -p "$CCACHE_DIR"
ccache -M 10G
ccache -o compression=false
