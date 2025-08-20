docker build . -t localhost:5000/hello-knativ:latest


k port-forward svc/registry -n kube-system 5000:5000 & 
docker push localhost:5000/hello-knativ:latest





#docker save localhost/hello-knativ:latest -o /tmp/img.tar
#sudo ctr -n k8s.io -a /run/k3s/containerd/containerd.sock image import /tmp/img.tar
#sudo ctr -n k8s.io -a /run/k3s/containerd/containerd.sock images ls | grep hello
#rm -rf /tmp/img.tar
