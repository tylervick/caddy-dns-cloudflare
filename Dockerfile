FROM docker.io/caddy:2.7.3-builder-alpine as builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@latest \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2@latest

FROM docker.io/caddy:2.7.3-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
