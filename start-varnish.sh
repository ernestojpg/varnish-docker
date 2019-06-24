#!/bin/sh

if [ -z "${VARNISH_PID_FILE}" ]; then
    VARNISH_PID_FILE="/var/run/varnish.pid"
fi

COMMAND="/usr/local/sbin/varnishd \
  -F \
  -P ${VARNISH_PID_FILE} \
  -f ${VARNISH_VCL_CONF} \
  -a ${VARNISH_LISTEN_ADDRESS}:${VARNISH_LISTEN_PORT} \
  ${DAEMON_OPTS}"

echo "Starting Varnish v${VARNISH_VERSION} ..."
echo ${COMMAND}

# Start the application replacing the current shell process
exec ${COMMAND}
