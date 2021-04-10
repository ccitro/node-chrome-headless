#!/usr/bin/env bash
set -euo pipefail
trap 's=$?; echo >&2 "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

git clean -fd
git pull

sed -r "s/[12][0-9]{3}[01][0-9][0-3][0-9]/$(date '+%Y%m%d')/g" -i Dockerfile

git commit -am "Cache bump"
git push

