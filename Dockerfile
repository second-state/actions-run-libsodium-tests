FROM wasmedge/wasmedge:latest

# args
ARG ZIG=zig-linux-x86_64-0.10.0.tar.xz

WORKDIR /root

# dependencies: Zig
RUN wget https://ziglang.org/builds/$ZIG
RUN mkdir -p .zig \
    && tar xvf $ZIG -C .zig --strip-components=1
RUN rm $ZIG
ENV PATH=/root/.zig:$PATH

# entrypoint
COPY entrypoint.sh /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]
