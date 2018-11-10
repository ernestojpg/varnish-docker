# 7 Nov 2018
# Image based on Debian 9.5 (Stretch) slim, compiling Varnish from scratch
# Build image: docker build -t varnish4 -f Dockerfile4 .
# Current image size: 168MB

FROM debian:9.5-slim

LABEL maintainer="Ernesto J. Perez <ernesto.perez@esl-asia.com>"

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

ENV VARNISH_VERSION 5.1.3

RUN set -x \
 && addgroup --system varnish \
 && adduser --system --disabled-password --no-create-home --home /nonexistent \
            --shell /usr/sbin/nologin --ingroup varnish --gecos 'Varnish Cache' varnish \
 && adduser --system --disabled-password --no-create-home --home /nonexistent \
            --shell /usr/sbin/nologin --ingroup varnish --gecos 'varnishlog user' varnishlog \
 && mkdir -p /usr/local/src /etc/varnish \
 && cd /usr/local/src \
 && apt-get update \
 && apt-get install --no-install-recommends --no-install-suggests -y \
        # Required for compilation
        make automake autotools-dev libedit-dev \
        libjemalloc-dev libncurses5-dev libpcre3-dev \
        libtool pkg-config python-docutils python-sphinx \
        ca-certificates wget \
        # Required at runtime
        libedit2 libjemalloc1 libncurses5 libpcre3 \
 && wget https://varnish-cache.org/_downloads/varnish-${VARNISH_VERSION}.tgz \
 && tar xzf varnish-${VARNISH_VERSION}.tgz \
 && cd varnish-${VARNISH_VERSION} \
 && ./autogen.sh \
 && ./configure \
 && make \
 && make install \
 && mv /usr/local/share/doc/varnish/example.vcl /etc/varnish/default.vcl \
 && apt-get remove --purge --auto-remove -y \
        make automake libedit-dev libjemalloc-dev libncurses5-dev libpcre3-dev pkg-config python-docutils python-sphinx \
        ca-certificates wget \
 #             autotools-dev (we can only delete a couple of dependencies from here)
 && strip /usr/local/bin/varnish* \
 && strip /usr/local/sbin/varnish* \
 && strip /usr/local/lib/*varnish*.so \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /usr/local/src/* /usr/local/man/*

ENV VARNISH_PORT 8080
EXPOSE 8080

# apt list --installed
# apt-cache depends packagename
# apt-cache rdepends --installed packagename
