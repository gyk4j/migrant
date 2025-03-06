#!/bin/bash

NS=centos
# ubuntu hashicorp
BOX=7
# trusty64 precise64
VERSION=2004.01
#20191107.0.0 1.1.0
PROVIDER=virtualbox
ARCH=unknown
#amd64 i386

curl -sSL https://api.cloud.hashicorp.com/vagrant/2022-09-30/registry/$NS | jq '.' > $NS-$BOX-1-registry.json
curl -sSL https://api.cloud.hashicorp.com/vagrant/2022-09-30/registry/$NS/box/$BOX | jq '.' > $NS-$BOX-2-current.json
curl -sSL https://api.cloud.hashicorp.com/vagrant/2022-09-30/registry/$NS/box/$BOX/versions | jq '.' > $NS-$BOX-3-versions.json
# VERSION=$(jq '.versions[0].name' centos-7-3-versions.json)
curl -sSL https://api.cloud.hashicorp.com/vagrant/2022-09-30/registry/$NS/box/$BOX/version/$VERSION/providers | jq '.' > $NS-$BOX-4-providers.json
# ARCH=$(jq '.providers[] | select(.name == "virtualbox") | .summary.architecture_types[0]' centos-7-4-providers.json)
curl -sSL https://api.cloud.hashicorp.com/vagrant/2022-09-30/registry/$NS/box/$BOX/version/$VERSION/provider/$PROVIDER/architecture/$ARCH/download | jq '.' > $NS-$BOX-5-download.json
# URL=$(jq '.url' centos-7-5-download.json)
# curl -sSL -o $NS-$BOX-$VERSION.box $URL
