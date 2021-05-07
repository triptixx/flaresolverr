ARG ALPINE_TAG=3.13
ARG FLARESOLVERR_VER=1.2.5

FROM node:alpine AS builder

ARG FLARESOLVERR_VER
ENV PUPPETEER_PRODUCT=chrome \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

### install flaresolverr
WORKDIR /output/flaresolverr
RUN apk add --no-cache git; \
    git clone https://github.com/FlareSolverr/FlareSolverr.git --branch v${FLARESOLVERR_VER} /flaresolverr-src; \
    cp -a /flaresolverr-src/package.json /flaresolverr-src/package-lock.json /flaresolverr-src/tsconfig.json .; \
    npm install; \
    cp -a /flaresolverr-src/src .; \
    npm run build; \
    npm prune --production; \
    rm -rf src tsconfig.json; \
    find ./node_modules/* -name 'node_modules' -type d -prune -print -exec rm -rf '{}' \;

COPY *.sh /output/usr/local/bin/
RUN chmod +x /output/usr/local/bin/*.sh

#============================================================

FROM loxoo/alpine:${ALPINE_TAG}

ARG FLARESOLVERR_VER
ENV SUID=922 SGID=922 \
    PUPPETEER_PRODUCT=chrome \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

LABEL org.label-schema.name="flaresolverr" \
      org.label-schema.description="A docker image for proxy server to bypass Cloudflare protection" \
      org.label-schema.url="https://github.com/FlareSolverr/FlareSolverr.git" \
      org.label-schema.version=${FLARESOLVERR_VER}

COPY --from=builder /output/ /

WORKDIR /flaresolverr
RUN apk add --no-cache npm chromium

EXPOSE 8191/TCP

HEALTHCHECK --start-period=10s --timeout=5s \
    CMD wget -qO /dev/null --header=Content-Type:application/json "http://localhost:8191"

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
CMD ["npm", "start"]
