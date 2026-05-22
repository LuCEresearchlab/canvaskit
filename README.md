Environment to build a customized version of [CanvasKit](https://skia.org/docs/user/modules/canvaskit/)
for [Pytamaro Web](https://pytamaro.si.usi.ch).

Targeting CanvasKit 0.40.0

## Changes

- Add `Font.prototype.getXPos` and `Font.prototype.getPath` methods ([patch](./patches/0001-canvaskit-add-Font.prototype.getXPos-and-Font.protot.patch))
- Add `Font.prototype.measureText` method ([patch](./patches/0002-canvaskit-add-Font.measureText.patch))
- Add `SimpleSVGCanvas` class ([patch](./patches/0003-canvaskit-add-SVGCanvas.patch))
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
