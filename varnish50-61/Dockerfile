# Varnish Docker image based on Debian 9.9 (Stretch) slim, compiling Varnish from scratch.
#
# We have two installation groups, for compilation and runtime, and we delete the compilation one at the end.
# Group for compilation: https://varnish-cache.org/docs/6.1/installation/install.html
# Group for runtime: https://packages.debian.org/stable/varnish
#
# Example of how to build the image:
#   docker build --build-arg VARNISH_VERSION=6.1.1 -t ernestojpg/varnish:6.1.1 -f varnish50-61/Dockerfile .
#
# Last updated: 26 June 2019
# Current image size: 162MB

FROM debian:9.9-slim

LABEL maintainer="Ernesto J. Perez <ernestojpg@gmail.com>"

# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

ARG VARNISH_VERSION=6.1.1

ENV VARNISH_VERSION=${VARNISH_VERSION} \
    VARNISH_VCL_CONF=/etc/varnish/default.vcl \
    VARNISH_LISTEN_PORT=8080

COPY start-varnish.sh /tmp/

RUN set -eux \
 && addgroup --system varnish \
 && adduser --system --disabled-password --no-create-home --home /nonexistent \
            --shell /usr/sbin/nologin --ingroup varnish --gecos 'Varnish Cache' varnish \
 && adduser --system --disabled-password --no-create-home --home /nonexistent \
            --shell /usr/sbin/nologin --ingroup varnish --gecos 'varnishlog user' varnishlog \
 && mkdir -p /usr/local/src /etc/varnish \
 && cd /usr/local/src \
 && apt-get update \
 && apt-get install --no-install-recommends --no-install-suggests -y \
        # Packages required only for compilation
        make automake autoconf-archive autotools-dev libedit-dev \
        libjemalloc-dev libncurses5-dev libpcre3-dev \
        libtool pkg-config python-docutils python-sphinx graphviz \
        ca-certificates wget \
        # Packages required at runtime
        gcc init-system-helpers libbsd0 libc6 libc6-dev libedit2 libjemalloc1 libncurses5 \
        libpcre3 libtinfo5 \
 && wget -q https://varnish-cache.org/_downloads/varnish-${VARNISH_VERSION}.tgz \
 && tar -xzf varnish-${VARNISH_VERSION}.tgz \
 && cd varnish-${VARNISH_VERSION} \
 && ./autogen.sh \
 && ./configure \
 && make \
 && make install \
 # Delete all packages required only for compilation
 && apt-get remove --purge --auto-remove -y \
        make automake autoconf-archive autotools-dev libedit-dev \
        libjemalloc-dev libncurses5-dev libpcre3-dev \
        libtool pkg-config python-docutils python-sphinx graphviz \
        ca-certificates wget \
 && strip /usr/local/bin/varnish* \
 && strip /usr/local/sbin/varnish* \
 && strip /usr/local/lib/*varnish*.so \
 && strip /usr/local/lib/varnish/vmods/*.so \
 && chmod a+x /tmp/*.sh \
 && mv /tmp/*.sh /usr/local/bin/ \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /var/log/apt/* /usr/local/src/* /usr/local/man/* \
 && find /var/log -type f -name '*log' -exec truncate --size=0 {} \;

COPY default.vcl ${VARNISH_VCL_CONF}

EXPOSE ${VARNISH_LISTEN_PORT}

CMD ["/usr/local/bin/start-varnish.sh"]