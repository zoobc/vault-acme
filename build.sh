#!/bin/sh
TAG=remilapeyre/vault-acme:build

echo Building $TAG
docker build -t "$TAG" . -f Dockerfile.build

docker container create --name extract "$TAG" 
docker container cp extract:/go/src/github.com/remilapeyre/vault-acme/build ./build
docker container rm -f extract
