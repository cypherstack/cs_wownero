# `cs_wownero`
[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

A [Melos](https://github.com/invertase/melos) monorepo for the
[`cs_wownero` package](https://pub.dev/packages/cs_wownero), 
the [`cs_wownero_flutter_libs` package](https://pub.dev/packages/cs_wownero), and their dependencies.

# About
- A simplified Flutter/Dart Wownero wallet library. Fork of cs_monero
- Depends on https://github.com/MrCyjaneK/monero_c/
- Abstracts the wallet2 spaghetti.
- Refactored and organized version of flutter_libmonero based on
  https://github.com/cypherstack/flutter_libmonero/tree/heavy-refactor.

## Getting started
[Install Melos](https://melos.invertase.dev/~melos-latest/getting-started) (`dart pub global activate melos`) and 
run `melos bootstrap` (or `melos bs`) in this root directory to get started.

## Build libraries from source (optional but recommended)
By default, `cs_wownero_flutter_libs` will automatically include and download the
appropriate platform-specific binaries when you run `flutter pub get`.  Use
these at your own risk.  For windows building see building notes before 
proceeding.  To build the libraries yourself:

1. Add this repo as a git submodule to your project and add `cs_wownero`and 
   `cs_wownero_flutter_libs` to your pubspec.yaml as relative/path dependencies.
2. Install [Melos](https://pub.dev/packages/melos)
   (`dart pub global activate melos`) and run `melos bootstrap` (or `melos bs`).
3. Build the platform you want using one of the following commands:
   - `melos build:android`
   - `melos build:ios`
   - `melos build:linux`
   - `melos build:macos`
   - `melos build:windows`
4. Run `melos copyLibs` to copy the binaries to where Flutter can find them.

### Building notes
- This repo's build scripts are just wrappers around `monero_c`'s build scripts.
  For details and requirements see https://github.com/MrCyjaneK/monero_c/
- To do a clean/fresh build, just the delete the top level `build` dir.
- Windows: Builds have been tested on Windows 11 with Ubuntu 24.04 in WSL2.  Do 
  not install Flutter via Snap, follow one of these guides instead:
  https://docs.flutter.dev/get-started/install/linux/desktop
- Windows: Due to path handling in a makefile in monero_c, the WSL `PATH` cannot contain spaces or brackets.  To work around this, run `melos prepareMoneroC` and then `export PATH=$(echo "$PATH" | tr ':' '\n' | grep -v '[ ()]' | paste -sd:)` before running `melos build:windows`.

## TODO
- Tests? (at least what is possible)
- Accounts API?
- Use FFI project skeleton for libs vs Platform Plugin?
- Cleaner/more user friendly API