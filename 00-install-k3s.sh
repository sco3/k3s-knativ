#!/usr/bin/env -S bash

set -xueo pipefail

curl -sfL https://get.k3s.io | sh -s - --disable traefik
echo backup your ~/.kube/config
echo sudo cat /etc/rancher/k3s/k3s.yaml > ~/.kube/config