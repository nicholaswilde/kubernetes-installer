#!/bin/bash

if ! command -v kubectl &> /dev/null; then
    echo 'kubectl is not installed'
    exit 1
fi

kubectl delete -f manifests/ingress.yaml
kubectl delete -f manifests/deployment.yaml
kubectl delete -f manifests/service.yaml
kubectl delete -f manifests/secret.yaml
kubectl delete -f manifests/namespace.yaml
