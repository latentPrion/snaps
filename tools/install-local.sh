#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
snap_file="$(ls -t davinci-resolve-host_*.snap 2>/dev/null | head -1)"

if [[ -z "$snap_file" ]]; then
  echo "No davinci-resolve-host_*.snap file found. Run tools/build-local.sh first." >&2
  exit 1
fi

sudo snap install --dangerous --classic "$snap_file"

