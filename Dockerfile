FROM docker.io/caddy:2.6.4-builder-alpine as builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@latest \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2

FROM docker.io/caddy:2.6.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
