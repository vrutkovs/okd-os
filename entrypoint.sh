#!/bin/sh
set -exuo pipefail
export COSA_SKIP_OVERLAY=1

IMAGE="quay.io/vrutkovs/okd-os:${CIRRUS_CHANGE_IN_REPO}"
echo ${QUAY_PASSWORD} | skopeo login --authfile=~/.docker/config.json quay.io --username "vrutkovs+cirrus" --password-stdin

cosa init /src --force

# Copy overrides
cp -rvf /overrides/* ./overrides

# Create repo in overrides
pushd /srv/okd-repo
  createrepo_c .
popd

# build ostree commit
cosa fetch --update-lockfile
cosa build ostree

echo "Building container"
cosa upload-oscontainer --name ${IMAGE}
