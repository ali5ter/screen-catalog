#!/usr/bin/env bash
# @file config.sh
# Configuration to support the generation of a catalog of web app screenshots
# @author Alister Lewis-Bowen <bowena@vmware.com>

# TMC stack configuration ----------------------------------------------------

# shellcheck disable=SC2034
APP_LOGIN_URL='https://login.foo.com'
APP_URL="https://service.foo.com"

# shot-scraper configuration -------------------------------------------------

SS_AUTH_CONTEXT="${HOME}/.config/shot-scraper/service-foo-com.json"
SS_WAIT='2000' # milliseconds
SS_HEIGHT='1080' # px

# Screen shot configuration --------------------------------------------------

BREAKPOINTS=(1280 640 320) # 3 viewport sizes
SCREENS_DIR="screens_$(date +'%Y%m%d%H')"

# Note: Screen to be captured are listed as their URL Paths in screens.txt