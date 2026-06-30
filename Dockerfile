FROM caddy:2.8-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare

FROM caddy:2.8-image

COPY --from=builder /usr/bin/caddy /usr/bin/caddy