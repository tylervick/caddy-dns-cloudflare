FROM docker.io/caddy:2.6.4-builder-alpine as builder

RUN xcaddy build \
    --with github.com/caddy-dns/digitalocean

FROM docker.io/caddy:2.6.4-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
