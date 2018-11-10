#!/bin/sh

COMMAND="/usr/local/sbin/varnishd \
  -F \
  -P /var/run/varnish.pid \
  -f ${VARNISH_VCL_CONF} \
  -a ${VARNISH_LISTEN_ADDRESS}:${VARNISH_LISTEN_PORT} \
  ${DAEMON_OPTS}"

#	-P /var/run/varnish.pid \
#	-f $VARNISH_VCL_CONF \
#	-a ${VARNISH_LISTEN_ADDRESS}:${VARNISH_LISTEN_PORT} \
#	-T ${VARNISH_ADMIN_LISTEN_ADDRESS}:${VARNISH_ADMIN_LISTEN_PORT} \
#	-S $VARNISH_SECRET_FILE \
#	-s $VARNISH_STORAGE \
#	$DAEMON_OPTS"

echo "Starting Varnish v${VARNISH_VERSION} ..."

# Start the application replacing the current shell process
exec ${COMMAND}