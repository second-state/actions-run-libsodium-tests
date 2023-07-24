FROM wasmedge/wasmedge:latest

# args
ARG ZIG_VERSION=0.10.1
ARG ZIG=zig-linux-x86_64-$ZIG_VERSION.tar.xz

WORKDIR /root

# dependencies: Zig
RUN wget https://ziglang.org/download/$ZIG_VERSION/$ZIG
RUN mkdir -p .zig \
    && tar xvf $ZIG -C .zig --strip-components=1
RUN rm $ZIG
ENV PATH=/root/.zig:$PATH

# entrypoint
COPY entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]
