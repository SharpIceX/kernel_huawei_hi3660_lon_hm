#!/usr/bin/env bash

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$(cd "$SCRIPT_DIR/../../../submodules/gcc-4.9/bin" && pwd)"

CMD_NAME="${0##*/}"
GCC_BIN="$BIN_DIR/921d9846-a815-11e9-84ea-ff8bce1b90b6"
GXX_BIN="$BIN_DIR/db96eedc-a815-11e9-a708-d79346614c9b"

case "$CMD_NAME" in
    *g++|*c++) REAL_COMPILER="$GXX_BIN" ;;
    *)         REAL_COMPILER="$GCC_BIN" ;;
esac

FINAL_ARGS=()
EXEC_BIN="$REAL_COMPILER"

while [[ $# -gt 0 ]]; do
    case "$1" in
        --gomacc-path)
            [[ -f "$2" ]] && { EXEC_BIN="$2"; FINAL_ARGS+=("$REAL_COMPILER"); }
            shift 2 ;;
        *)
            FINAL_ARGS+=("$1")
            shift ;;
    esac
done

if [[ ! -x "$REAL_COMPILER" ]]; then
    echo "Error: Cannot find or execute real compiler at $REAL_COMPILER" >&2
    exit 1
fi

exec "$EXEC_BIN" "${FINAL_ARGS[@]}"