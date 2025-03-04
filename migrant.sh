#!/bin/bash

while IFS== read -r key value
do 
  #echo "$key: $value"
  eval $key='$value'
done < "Migrantfile.txt"

echo "Unquoted: $var1"
echo "  Quoted: $var2"
