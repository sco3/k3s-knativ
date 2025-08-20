#!/usr/bin/env -S bash

set -xueo pipefail


kubectl apply -f https://github.com/knative/net-kourier/releases/download/knative-v1.19.0/kourier.yaml
