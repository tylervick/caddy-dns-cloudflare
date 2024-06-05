FROM docker.io/caddy:2-builder-alpine as builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare@latest \
    --with github.com/mholt/caddy-dynamicdns@latest \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2@latest

FROM docker.io/caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
