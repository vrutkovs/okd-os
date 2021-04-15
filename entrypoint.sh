#!/bin/sh
set -exuo pipefail
export COSA_SKIP_OVERLAY=1

# tmpdir for cosa
cd "$(mktemp -d)"
cosa init https://github.com/coreos/fedora-coreos-config --branch next-devel

# Copy overrides
cp -rvf /overrides/* ./overrides

# build ostree commit
cosa fetch --update-lockfile
cosa build ostree
