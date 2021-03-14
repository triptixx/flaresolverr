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
    -e LOG_LEVEL=debug \
    -e LOG_HTML=true \
    loxoo/flaresolverr
```
## Environment

- `$SUID`                   - User ID to run as. _default: `922`_
- `$SGID`                   - Group ID to run as. _default: `922`_
- `$CAPTCHA_SOLVER`         - This is used to select which captcha solving method it used when a captcha is encountered. _default: `none`_
- `$HARVESTER_ENDPOINT`     - Required if the captcha solver is Harvester. _optional_
- `$HEADLESS`               - This is used to debug the browser by not running it in headless mode. _default: `true`_
- `$LOG_LEVEL`              - Logging severity levels. _default: `info`_
- `$LOG_HTML`               - If true all HTML that passes through the proxy will be logged to the console in debug level. _default: `false`_
- `$TZ`                     - Timezone. _optional_

## Network

- `8191/tcp`       - The port that FlareSolverr should listen for api connections on.
