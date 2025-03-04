#!/bin/bash

read_config() {
  while IFS== read -r key value
  do 
    #echo "$key: $value"
    eval $key='$value'
  done < "Migrantfile.txt"
}

dump_config() {
  echo "Unquoted: $var1"
  echo "  Quoted: $var2"
}

main() {
  read_config
  dump_config
}

main
