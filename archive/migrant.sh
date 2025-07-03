#!/bin/bash

read_config() {
  while IFS== read -r key value
  do 
    echo "$key: $value"
    eval "$key=$value"
  done < "Migrantfile.txt"
}

dump_config() {
  echo "config_vm_box: $config_vm_box"
  echo "config_vm_box_version: $config_vm_box_version"
}

init_home() {
  MIGRANT_HOME=.migrant.d
  mkdir -p $MIGRANT_HOME/{boxes,data,gems,insecure_private_keys,rgloader,tmp}
  mkdir -p $MIGRANT_HOME/data/{fp-leases,machine-index}
  echo "1.0" > $MIGRANT_HOME/setup_version
  curl -sSL -o $MIGRANT_HOME/insecure_private_keys/vagrant.key.ed25519 https://raw.githubusercontent.com/hashicorp/vagrant/refs/heads/main/keys/vagrant.key.ed25519
  curl -sSL -o $MIGRANT_HOME/insecure_private_keys/vagrant.key.rsa https://raw.githubusercontent.com/hashicorp/vagrant/refs/heads/main/keys/vagrant.key.rsa
  cp $MIGRANT_HOME/insecure_private_keys/vagrant.key.rsa $MIGRANT_HOME/insecure_private_key
}

main() {
  read_config
  dump_config
  init_home
}

main
