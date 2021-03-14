#!/bin/sh
set -eo pipefail

# ANSI colour escape sequences
RED='\033[0;31m'
RESET='\033[0m'

exec su-exec $SUID:$SGID "$@"