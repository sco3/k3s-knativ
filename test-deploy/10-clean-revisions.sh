#!/bin/bash

set -e

# Настройки
NAMESPACE=default
SERVICE_NAME=bun-hello-server
IMAGE=ghcr.io/sco3/hello-knativ:latest


source ~/.local/gh-token.sh

SECRET_NAME=ghcr-secret

echo "Создаём secret для GHCR..."
kubectl create secret docker-registry $SECRET_NAME \
  --docker-server=ghcr.io \
  --docker-username=$GH_USERNAME \
  --docker-password=$GH_TOKEN \
  -n $NAMESPACE --dry-run=client -o yaml | kubectl apply -f -

echo "Привязываем secret к ServiceAccount default..."
kubectl patch serviceaccount default \
  -n $NAMESPACE \
  -p "{\"imagePullSecrets\": [{\"name\": \"$SECRET_NAME\"}]}"

echo "Удаляем старые ревизии сервиса..."
kubectl delete ksvc $SERVICE_NAME -n $NAMESPACE --ignore-not-found

echo "Создаём сервис с новым образом..."
cat <<EOF | kubectl apply -f -
apiVersion: serving.knative.dev/v1
kind: Service
metadata:
  name: $SERVICE_NAME
  namespace: $NAMESPACE
spec:
  template:
    spec:
      containers:
        - image: $IMAGE
          ports:
            - containerPort: 8000
EOF

echo "Сервис $SERVICE_NAME создан. Проверяем статус..."
kubectl get ksvc 
