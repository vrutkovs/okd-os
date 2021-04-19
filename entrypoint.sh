#!/bin/sh
set -exuo pipefail
export COSA_SKIP_OVERLAY=1

cosa init /src --force

# Copy overrides
cp -rvf /overrides/* ./overrides

# build ostree commit
cosa fetch --update-lockfile
cosa build ostree

echo "Building container"
IMAGE="quay.io/vrutkovs/okd-os:${CIRRUS_CHANGE_IN_REPO}"
cosa upload-oscontainer --name ${IMAGE}
skopeo copy containers-storage://${IMAGE} docker://${IMAGE}
