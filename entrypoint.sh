#!/usr/bin/env bash
# XXX: workaround for $GITHUB_PATH
export PATH=$GITHUB_WORKSPACE/$INPUT_PATH:$PATH
# set and check WASI_RUNTIME
export WASI_RUNTIME=$1
which $WASI_RUNTIME
# get and run libsodium benchmarks
git clone --branch stable https://github.com/jedisct1/libsodium
cd libsodium
 ./dist-build/wasm32-wasi.sh --bench
