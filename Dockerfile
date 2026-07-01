FROM caddy:2.11.4-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/greenpau/caddy-security@v1.1.64 \
    --with github.com/greenpau/caddy-trace@v1.1.13

FROM caddy:2.11.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy