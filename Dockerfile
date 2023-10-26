ARG ALPINE_TAG=3.18
ARG FLARESOLVERR_VER=3.3.6

FROM loxoo/alpine:${ALPINE_TAG} AS builder

ARG FLARESOLVERR_VER

### install flaresolverr
WORKDIR /output/flaresolverr
RUN apk add --no-cache git py3-pip chromium-chromedriver; \
    git clone https://github.com/FlareSolverr/FlareSolverr.git --branch v${FLARESOLVERR_VER} /flaresolverr-src; \
    cp -a /usr/lib/chromium/chromedriver /flaresolverr-src/src/* /flaresolverr-src/package.json .; \
    sed -i -r 's/\/.*\/(chromedriver)/\/flaresolverr\/\1/' utils.py; \
    PY_VER=$(python -c "import sysconfig; print(sysconfig.get_path('purelib'))"); \
    pip install -t /output/${PY_VER} -r /flaresolverr-src/requirements.txt

COPY *.sh /output/usr/local/bin/
RUN chmod +x /output/usr/local/bin/*.sh

#============================================================

FROM loxoo/alpine:${ALPINE_TAG}

ARG FLARESOLVERR_VER
ENV SUID=922 SGID=922

LABEL org.label-schema.name="flaresolverr" \
      org.label-schema.description="A docker image for proxy server to bypass Cloudflare protection" \
      org.label-schema.url="https://github.com/FlareSolverr/FlareSolverr.git" \
      org.label-schema.version=${FLARESOLVERR_VER}

COPY --from=builder /output/ /

WORKDIR /flaresolverr
RUN apk add --no-cache python3 chromium xvfb; \
    addgroup -g $SGID flaresolverr; \
    adduser -G flaresolverr -D -u $SUID flaresolverr

EXPOSE 8191/TCP 8192/TCP

HEALTHCHECK --start-period=10s --timeout=5s \
    CMD wget -qO /dev/null --header=Content-Type:application/json "http://localhost:8191"

ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/entrypoint.sh"]
CMD ["python", "-u", "/flaresolverr/flaresolverr.py"]
