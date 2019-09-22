#!/bin/sh

# Varnish 6.0.4 -> 6.0

docker build \
   --build-arg VARNISH_VERSION=6.0.4 \
   -t ernestojpg/varnish:6.0.4 \
   -f varnish50-61/Dockerfile .
docker tag ernestojpg/varnish:6.0.4 ernestojpg/varnish:6.0
docker push ernestojpg/varnish:6.0.4
docker push ernestojpg/varnish:6.0

# Varnish 6.2.1 -> 6.2

docker build \
   --build-arg VARNISH_VERSION=6.2.1 \
   -t ernestojpg/varnish:6.2.1 \
   -f varnish62-63/Dockerfile .
docker tag ernestojpg/varnish:6.2.1 ernestojpg/varnish:6.2
docker push ernestojpg/varnish:6.2.1
docker push ernestojpg/varnish:6.2

# Varnish 6.3.0 -> 6.3 -> 6 -> latest

docker build \
   --build-arg VARNISH_VERSION=6.3.0 \
   -t ernestojpg/varnish:6.3.0 \
   -f varnish62-63/Dockerfile .
docker tag ernestojpg/varnish:6.3.0 ernestojpg/varnish:6.3
docker tag ernestojpg/varnish:6.3.0 ernestojpg/varnish:6
docker tag ernestojpg/varnish:6.3.0 ernestojpg/varnish:latest
docker push ernestojpg/varnish:6.3.0
docker push ernestojpg/varnish:6.3
docker push ernestojpg/varnish:6
docker push ernestojpg/varnish:latest
