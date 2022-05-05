#!/usr/bin/env bash
git clone --branch stable https://github.com/jedisct1/libsodium
cd libsodium
export WASI_RUNTIME=$1
./dist-build/wasm32-wasi.sh --bench
