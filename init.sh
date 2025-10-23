#!/usr/bin/env bash
# Reference: https://github.com/google/skia/blob/main/modules/canvaskit/README.md
set -e

BASE_DIR="$(realpath "$(dirname "$0")")"

cd "$BASE_DIR/skia"
python3 tools/git-sync-deps
python3 bin/fetch-ninja
cd "$BASE_DIR/skia/modules/canvaskit"
npm ci
