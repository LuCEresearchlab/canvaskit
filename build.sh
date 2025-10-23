#!/usr/bin/env bash
set -e

BASE_DIR="$(realpath "$(dirname "$0")")"
CK_DIR="$BASE_DIR/skia/modules/canvaskit"
OUT_CK_WASM="$BASE_DIR/skia/out/canvaskit_wasm"
OUT_DIR="$BASE_DIR/out"

"$CK_DIR/compile.sh" release \
  legacy_draw_vertices \
  no_alias_font \
  no_encode_jpeg \
  no_encode_webp \
  no_effects_deserialization \
  no_embedded_font \
  no_paragraph \
  no_skottie \
  no_sksl_trace \
  no_woff2

cp "$OUT_CK_WASM/canvaskit.js"          "$OUT_DIR/canvaskit.js"
cp "$OUT_CK_WASM/canvaskit.wasm"        "$OUT_DIR/canvaskit.wasm"
cp "$CK_DIR/npm_build/types/index.d.ts" "$OUT_DIR/canvaskit.d.ts"
echo "Done! Files copied to $OUT_DIR"
