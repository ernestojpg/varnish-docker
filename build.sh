#!/bin/bash

# Exit on error
set -e

# Varnish 5.0.0 -> 5.0

docker build \
   --build-arg VARNISH_VERSION=5.0.0 \
   -t ernestojpg/varnish:5.0.0 \
   -f varnish50-61/Dockerfile .
docker tag ernestojpg/varnish:5.0.0 ernestojpg/varnish:5.0
docker push ernestojpg/varnish:5.0.0
docker push ernestojpg/varnish:5.0

# Varnish 5.1.1

docker build \
   --build-arg VARNISH_VERSION=5.1.1 \
   -t ernestojpg/varnish:5.1.1 \
   -f varnish50-61/Dockerfile .
docker push ernestojpg/varnish:5.1.1

# Varnish 5.1.2

docker build \
   --build-arg VARNISH_VERSION=5.1.2 \
   -t ernestojpg/varnish:5.1.2 \
   -f varnish50-61/Dockerfile .
docker push ernestojpg/varnish:5.1.2

# Varnish 5.1.3 -> 5.1

docker build \
   --build-arg VARNISH_VERSION=5.1.3 \
   -t ernestojpg/varnish:5.1.3 \
   -f varnish50-61/Dockerfile .
docker tag ernestojpg/varnish:5.1.3 ernestojpg/varnish:5.1
docker push ernestojpg/varnish:5.1.3
docker push ernestojpg/varnish:5.1

# Varnish 5.2.0

docker build \
   --build-arg VARNISH_VERSION=5.2.0 \
   -t ernestojpg/varnish:5.2.0 \
   -f varnish50-61/Dockerfile .
docker push ernestojpg/varnish:5.2.0

# Varnish 5.2.1 -> 5.2 -> 5

docker build \
   --build-arg VARNISH_VERSION=5.2.1 \
   -t ernestojpg/varnish:5.2.1 \
   -f varnish50-61/Dockerfile .
docker tag ernestojpg/varnish:5.2.1 ernestojpg/varnish:5.2
docker tag ernestojpg/varnish:5.2.1 ernestojpg/varnish:5
docker push ernestojpg/varnish:5.2.1
docker push ernestojpg/varnish:5.2
docker push ernestojpg/varnish:5

# Varnish 6.0.0

docker build \
   --build-arg VARNISH_VERSION=6.0.0 \
   -t ernestojpg/varnish:6.0.0 \
   -f varnish50-61/Dockerfile .
docker push ernestojpg/varnish:6.0.0

# Varnish 6.0.1

docker build \
   --build-arg VARNISH_VERSION=6.0.1 \
   -t ernestojpg/varnish:6.0.1 \
   -f varnish50-61/Dockerfile .
docker push ernestojpg/varnish:6.0.1

# Varnish 6.0.2

docker build \
   --build-arg VARNISH_VERSION=6.0.2 \
   -t ernestojpg/varnish:6.0.2 \
   -f varnish50-61/Dockerfile .
docker push ernestojpg/varnish:6.0.2

# Varnish 6.0.3

docker build \
   --build-arg VARNISH_VERSION=6.0.3 \
   -t ernestojpg/varnish:6.0.3 \
   -f varnish50-61/Dockerfile .
docker push ernestojpg/varnish:6.0.3

# Varnish 6.0.4 -> 6.0

docker build \
   --build-arg VARNISH_VERSION=6.0.4 \
   -t ernestojpg/varnish:6.0.4 \
   -f varnish50-61/Dockerfile .
docker tag ernestojpg/varnish:6.0.4 ernestojpg/varnish:6.0
docker push ernestojpg/varnish:6.0.4
docker push ernestojpg/varnish:6.0

# Varnish 6.1.0

docker build \
   --build-arg VARNISH_VERSION=6.1.0 \
   -t ernestojpg/varnish:6.1.0 \
   -f varnish50-61/Dockerfile .
docker push ernestojpg/varnish:6.1.0

# Varnish 6.1.1 -> 6.1

docker build \
   --build-arg VARNISH_VERSION=6.1.1 \
   -t ernestojpg/varnish:6.1.1 \
   -f varnish50-61/Dockerfile .
docker tag ernestojpg/varnish:6.1.1 ernestojpg/varnish:6.1
docker push ernestojpg/varnish:6.1.1
docker push ernestojpg/varnish:6.1

# Varnish 6.2.0

docker build \
   --build-arg VARNISH_VERSION=6.2.0 \
   -t ernestojpg/varnish:6.2.0 \
   -f varnish62-63/Dockerfile .
docker push ernestojpg/varnish:6.2.0

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
