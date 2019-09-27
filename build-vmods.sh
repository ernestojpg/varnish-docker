#!/bin/bash

# Exit on error
set -e

# Varnish 6.3.0-vmods -> 6.3-vmods -> 6-vmods -> vmods

docker build \
   --build-arg VARNISH_VERSION=6.3.0 \
   --build-arg VARNISH_MODULES_COMMIT=3a78e8a466f0e0dc43b0436b7bbedb60170805e3 \
   --build-arg VARNISH_MODULES_VERSION=6.2-20190417 \
   --build-arg LIBVMOD_BLOBDIGEST_COMMIT=bb1e30858c2abe268380dca027d8318945d4c38f \
   --build-arg LIBVMOD_BLOBDIGEST_VERSION=6.2-20190314 \
   --build-arg LIBVMOD_PARSEFORM_COMMIT=a0561a1edc4f3850af208bb7a9436f326eb7ce99 \
   --build-arg LIBVMOD_PARSEFORM_VERSION=master-20190919 \
   -t ernestojpg/varnish:6.3.0-vmods \
   -f varnish62-63/Dockerfile-vmods .
docker tag ernestojpg/varnish:6.3.0-vmods ernestojpg/varnish:6.3-vmods
docker tag ernestojpg/varnish:6.3.0-vmods ernestojpg/varnish:6-vmods
docker tag ernestojpg/varnish:6.3.0-vmods ernestojpg/varnish:vmods
docker push ernestojpg/varnish:6.3.0-vmods
docker push ernestojpg/varnish:6.3-vmods
docker push ernestojpg/varnish:6-vmods
docker push ernestojpg/varnish:vmods
