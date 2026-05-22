#!/usr/bin/env bash
# Reference: https://github.com/google/skia/blob/main/modules/canvaskit/README.md
set -e

BASE_DIR="$(realpath "$(dirname "$0")")"
SKIA_DIR="$BASE_DIR/skia"

git update-index --assume-unchanged "$SKIA_DIR"
git update-index --skip-worktree "$SKIA_DIR"
cd "$SKIA_DIR"
python3 tools/git-sync-deps
python3 bin/fetch-ninja
cd "$BASE_DIR/skia/modules/canvaskit"
npm ci
