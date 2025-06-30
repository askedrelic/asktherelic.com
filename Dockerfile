# Stage 1: Build Hugo site
FROM hugomods/hugo:exts AS builder

WORKDIR /src
COPY . .
RUN hugo --minify -b "https://flyblog.asktherelic.com"

# Stage 2: Serve static files
FROM pierrezemb/gostatic
COPY --from=builder /src/public /srv/http/
ENTRYPOINT ["/goStatic", "-port","8080", "-log-level","debug"]
