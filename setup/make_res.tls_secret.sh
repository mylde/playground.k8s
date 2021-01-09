#!/bin/bash

if [ ! -f private.key -o ! -f server.crt ]; then
  echo 'No private.key or server.crt found. Run make_cert.sh first.';
  exit 1;
fi

kubectl create secret tls pg-k8s-tls \
    --namespace pg-k8s \
    --key=private.key \
    --cert=server.crt \
    --dry-run=client \
    -o yaml > ../def/secret.tls.yml