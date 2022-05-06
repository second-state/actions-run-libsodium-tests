# Action: Run [libsodium] Tests

This is a GitHub Action to run [libsodium] benchmarks on a specified
WebAssembly runtime.

[libsodium]: https://github.com/jedisct1/libsodium

Note that this action may takes a very long time,
like 20 minutes on V8 (Node.js) on a GitHub-hosted runner, to finish.

## Example

Here is an example using [WasmEdge] as runtime.

[WasmEdge]: https://github.com/WasmEdge/WasmEdge

```yaml
jobs:
  run-libsodium-tests:
    runs-on: ubuntu-latest
    steps:
      - name: Install WasmEdge
        run: |
          ${{ script.to-install-wasmedge.at-SOME_DIR }}
      - name: Run libsodium tests with WasmEdge
        uses: second-state/wasmedge-actions-libsodium-tests@v0.0.1
        with:
          path: SOME_DIR/bin
          wasi-runtime: wasmedge
```

## Supported Runtimes

The self-testing workflow uses [Node.js] v16.15.0 LTS.

Please refer to [libsodium/test/default/wasi-test-wrapper.sh] for
all runtimes supported by [libsodium].

[Node.js]: https://nodejs.org/
[libsodium/test/default/wasi-test-wrapper.sh]: https://github.com/jedisct1/libsodium/blob/stable/test/default/wasi-test-wrapper.sh
