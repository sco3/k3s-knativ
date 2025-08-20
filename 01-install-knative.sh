#!/usr/bin/env -S bash

set -xueo pipefail




kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.19.0/serving-crds.yaml
kubectl apply -f https://github.com/knative/serving/releases/download/knative-v1.19.0/serving-core.yaml




echo k top pod --all-namespaces 
echo NAMESPACE         NAME                                      CPU(cores)   MEMORY(bytes)   
echo knative-serving   activator-76fc47ccbc-gvpjb                1m           9Mi             
echo knative-serving   autoscaler-fd75468cb-v7b9s                1m           9Mi             
echo knative-serving   controller-86cf6454bb-sxfdp               2m           13Mi            
echo knative-serving   webhook-6688f4d78d-26cws                  3m           13Mi            
echo kube-system       coredns-5688667fd4-bm655                  3m           15Mi            
echo kube-system       local-path-provisioner-774c6665dc-r7hqj   1m           7Mi             
echo kube-system       metrics-server-6f4c6675d5-jgtkz           7m           20Mi  