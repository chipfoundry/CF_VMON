#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
OUT="${TMPDIR:-/tmp}/cf_vmon_tb"
iverilog -g2005 -o "$OUT" \
  "$ROOT/hdl/gl/CF_VMON.v" \
  "$ROOT/verify/beh_model/CF_VMON_core.v" \
  "$ROOT/verify/beh_model/tb_CF_VMON.v"
vvp "$OUT"
