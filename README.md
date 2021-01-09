# playground k8s

## as of Jan 2021
```
ing:nginx -- svc:nginx - deploy:nginx
|         `- svc:httpd - deploy:httpd
 ` secret:tls
```

## Before you run
```
# Before setup
$ cd setup

# Make private key and server self signed cert.
# Common name will be set to pg-k8s.local in the next step making Secret resource.
$ sh make_cert.sh

# Make Secret resource with private key and server cert.
$ sh make_res.tls.secret.sh
```

## Resources
```
def/namespace.yml
def/deployment.yml
def/service.yml
def/secret.tls.yml
def/ingress.yml
```

## Run
```
# Create namespace.
$ kubectl apply -f def/namespace.yml

# Create the rest of resources.
$ kubectl apply -f def

# nginx
$ curl -k --resolve pg-k8s.local:443:127.0.0.1 https://pg-k8s.local/nginx

# httpd
$ curl -k --resolve pg-k8s.local:443:127.0.0.1 https://pg-k8s.local/httpd
```
