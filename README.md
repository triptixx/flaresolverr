[hub]: https://hub.docker.com/r/loxoo/flaresolverr
[mbdg]: https://microbadger.com/images/loxoo/flaresolverr
[git]: https://github.com/triptixx/flaresolverr
[actions]: https://github.com/triptixx/flaresolverr/actions

# [loxoo/flaresolverr][hub]
[![Layers](https://images.microbadger.com/badges/image/loxoo/flaresolverr.svg)][mbdg]
[![Latest Version](https://images.microbadger.com/badges/version/loxoo/flaresolverr.svg)][hub]
[![Git Commit](https://images.microbadger.com/badges/commit/loxoo/flaresolverr.svg)][git]
[![Docker Stars](https://img.shields.io/docker/stars/loxoo/flaresolverr.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/loxoo/flaresolverr.svg)][hub]
[![Build Status](https://github.com/triptixx/flaresolverr/workflows/docker%20build/badge.svg)][actions]

## Usage

```shell
docker run -d \
    --name=srvflaresolverr \
    --restart=unless-stopped \
    --hostname=srvflaresolverr \
    loxoo/flaresolverr
```
## Environment

- `$SUID`         - User ID to run as. _default: `901`_
- `$SGID`         - Group ID to run as. _default: `901`_
- `$LOG_LEVEL`    - Logging severity levels. _default: `info`_
- `$TZ`           - Timezone. _optional_

## Volume

- `/config`       - Server configuration file location.

## Network

- `53/udp`        - Dns port udp.
