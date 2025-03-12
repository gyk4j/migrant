#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Error: Illegal number of parameters"
  echo "$0 <namespace> <box>"
  echo "Example: $0 hashicorp precise64"
  exit 1
fi

NS=$1
BOX=$2

API_DATE=2022-09-30
# NS=hashicorp
# ubuntu hashicorp generic
# BOX=bionic64
# trusty64 bionic64 centos7
# VERSION=1.0.282
#20191107.0.0 1.0.282 2004.01 4.3.12
PROVIDER=virtualbox
# ARCH=unknown
#amd64 i386

# Main page for namespace.
#curl -sS https://api.cloud.hashicorp.com/vagrant/$API_DATE/registry/$NS | jq '.' > $NS-$BOX-1-registry.json

# Main page for box (latest/current version).
#curl -sS https://api.cloud.hashicorp.com/vagrant/$API_DATE/registry/$NS/box/$BOX | jq '.' > $NS-$BOX-2-current.json

# List all box versions.
curl -sS https://api.cloud.hashicorp.com/vagrant/$API_DATE/registry/$NS/box/$BOX/versions | jq '.' > $NS-$BOX-3-versions.json
VERSION=$(jq -r '.versions[0].name' $NS-$BOX-3-versions.json)
echo "Found VERSION = $VERSION"

# List all providers and architectures for a particular version.
curl -sS https://api.cloud.hashicorp.com/vagrant/$API_DATE/registry/$NS/box/$BOX/version/$VERSION/providers | jq '.' > $NS-$BOX-4-providers.json
ARCH=$(jq -r '.providers[] | select(.name == "virtualbox") | .summary.architecture_types[0]' $NS-$BOX-4-providers.json)
echo "Found ARCHITECTURE = $ARCH"

# Get the download URL.
curl -sS https://api.cloud.hashicorp.com/vagrant/$API_DATE/registry/$NS/box/$BOX/version/$VERSION/provider/$PROVIDER/architecture/$ARCH/download | jq '.' > $NS-$BOX-5-download.json
URL=$(jq -r '.url' $NS-$BOX-5-download.json)
echo "Found URL = $URL"

# Download the actual box.
# curl -sSL -o $NS-$BOX-$VERSION.box $URL

# Extract the .tar.gz box contents.
# mkdir -p .migrant.d/boxes/$NS-VAGRANTSLASH-$BOX/$VERSION/$ARCH/$PROVIDER
# tar -xvzf $NS-$BOX-$VERSION.box -C .migrant.d/boxes/$NS-VAGRANTSLASH-$BOX/$VERSION/$ARCH/$PROVIDER

# Pretend that we checked the registry for update.
# touch .migrant.d/boxes/$NS-VAGRANTSLASH-$BOX/$VERSION/$ARCH/$PROVIDER/box_update_check

# Create the metadata file with the box's source URL.
# As of 12 Mar 2025, the API version is "v2." This may change in future.
# echo "https://vagrantcloud.com/api/v2/vagrant/$NS/$BOX" > .migrant.d/boxes/$NS-VAGRANTSLASH-$BOX/metadata_url
