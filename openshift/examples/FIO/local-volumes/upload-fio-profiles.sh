#!/bin/bash

AUX="$1"
NS="${AUX:-default}"

cm=$(find -type f -name '*.fio' | sed "s/^\(.*\)/--from-file=\1 /" | tr -d '\n')

echo "Creating FIO profiles as ConfigMaps"
oc -n $NS create configmap fio-profiles-local &> /dev/null
oc -n $NS create configmap fio-profiles-local $cm -o yaml --dry-run | oc -n $NS replace -f -
