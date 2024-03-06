ARG LDWGVER=0.13.3
FROM alpine:3.19
WORKDIR /usr/local
RUN apk add ca-certificates \
    && wget -c https://github.com/rntrp/libredwg-musl-build/releases/download/v${LDWGVER}/libredwg-${LDWGVER}-${BUILDARCH}.tgz -qO- | tar -xz \
    && chmod +x /usr/local/bin/dwgread \
    && ln -s /usr/local/lib/libredwg.so.0.0.13 /usr/local/lib/libredwg.so.0 \
    && ln -s /usr/local/lib/libredwg.so.0.0.13 /usr/local/lib/libredwg.so
WORKDIR /
CMD ./usr/local/bin/dwgread --version
