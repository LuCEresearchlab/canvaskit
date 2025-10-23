Environment to build a customized version of [CanvasKit](https://skia.org/docs/user/modules/canvaskit/)
for [Pytamaro Web](https://pytamaro.si.usi.ch).

## Changes

- Removal of unnecessary features to reduce blob size

## Setup

### Dependencies

- `depot_tools`
- `bazel` (or `bazelisk`)
- `node`
- `python3`

### Initialize Environment

```bash
git submodule update --init
./init.sh
```

## Build CanvasKit

```bash
./build.sh
```
