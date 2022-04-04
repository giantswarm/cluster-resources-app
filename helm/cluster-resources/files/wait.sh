#!/bin/sh

expected_crds="ciliumclusterwidenetworkpolicies.cilium.io ciliumendpoints.cilium.io ciliumexternalworkloads.cilium.io ciliumidentities.cilium.io ciliumnetworkpolicies.cilium.io ciliumnodes.cilium.io"
echo "waiting for crds to be created: $expected_crds"
while true; do
  current_crds=$(kubectl get crds -o jsonpath='{.items[?(@.spec.group=="cilium.io")].metadata.name}')
  if [ "$expected_crds" = "$current_crds" ]; then
    echo "done"
    break
  fi
  printf "."
  sleep 5
done
