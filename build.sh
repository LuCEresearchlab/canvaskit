#!/usr/bin/env bash
set -e

BASE_DIR="$(realpath "$(dirname "$0")")"
CK_DIR="$BASE_DIR/skia/modules/canvaskit"
OUT_CK_WASM="$BASE_DIR/skia/out/canvaskit_wasm"
OUT_DIR="$1"

if [ "$#" -lt 1 ]; then
  echo "Provide the destination folder (e.g. pytamaro-web root) as argument"
  exit 1
fi

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

cp "$OUT_CK_WASM/canvaskit.wasm"        "$OUT_DIR/public/canvaskit/canvaskit.wasm"
cp "$OUT_CK_WASM/canvaskit.js"          "$OUT_DIR/src/canvaskit-wasm/canvaskit.js"
cp "$CK_DIR/npm_build/types/index.d.ts" "$OUT_DIR/src/canvaskit-wasm/canvaskit.d.ts"

echo "Done! Files copied to $OUT_DIR"
