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
- `$LOG_LEVEL`              - Logging severity levels. _default: `info`_
- `$LOG_HTML`               - If true all HTML that passes through the proxy will be logged to the console in debug level. _default: `false`_
- `$CAPTCHA_SOLVER`         - This is used to select which captcha solving method it used when a captcha is encountered. _default: `none`_
- `$HEADLESS`               - This is used to debug the browser by not running it in headless mode. _default: `true`_
- `$BROWSER_TIMEOUT`        - If you are experiencing errors/timeouts because your system is slow, you can try to increase this value. Remember to increase the maxTimeout parameter too. _default: `40000`_
- `$TEST_URL`               - FlareSolverr makes a request on start to make sure the web browser is working. You can change that URL if it is blocked in your country. _default: `https://www.google.com`_
- `$HOST`                   - Listening interface. You don't need to change this if you are running on Docker. _default: `0.0.0.0`_
- `$PROMETHEUS_ENABLED`     - Enable Prometheus exporter. See the Prometheus section below. _default: `false`_
- `$TZ`                     - Timezone. _optional_

## Network

- `8191/tcp`       - The port that FlareSolverr should listen for api connections on.
- `8192/tcp`       - The port that Prometheus should listen.