[hub]: https://hub.docker.com/r/loxoo/flaresolverr
[git]: https://github.com/triptixx/flaresolverr/tree/master
[actions]: https://github.com/triptixx/flaresolverr/actions/workflows/main.yml

# [loxoo/flaresolverr][hub]
[![Git Commit](https://img.shields.io/github/last-commit/triptixx/flaresolverr/master)][git]
[![Build Status](https://github.com/triptixx/flaresolverr/actions/workflows/main.yml/badge.svg?branch=master)][actions]
[![Latest Version](https://img.shields.io/docker/v/loxoo/flaresolverr/latest)][hub]
[![Size](https://img.shields.io/docker/image-size/loxoo/flaresolverr/latest)][hub]
[![Docker Stars](https://img.shields.io/docker/stars/loxoo/flaresolverr.svg)][hub]
[![Docker Pulls](https://img.shields.io/docker/pulls/loxoo/flaresolverr.svg)][hub]

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