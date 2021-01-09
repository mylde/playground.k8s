#!/bin/bash

echo 'Generating private key'
openssl genrsa 2048 > private.key
echo

echo 'Making server crt'
openssl req -new -x509 -days 3650 -key private.key -sha512 -out server.crt
