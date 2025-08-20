


source ~/.local/gh-token.sh



kubectl create secret docker-registry ghcr-secret \
  --docker-server=ghcr.io \
  --docker-username=sco3 \
  --docker-password="$GH_PAT" \
  -n default

kubectl patch serviceaccount default -p '{"imagePullSecrets":[{"name":"ghcr-secret"}]}'
