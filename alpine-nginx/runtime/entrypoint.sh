#!/bin/sh

#set -eo pipefail

WORKSPACE=/etc/confd
export ETCD_PORT=${ETCD_PORT:-4001}
export HOST_IP=${HOST_IP:-172.17.42.1}

if [ -z "$ETCD_ENDPOINT"]; then
  export ETCD_ENDPOINT=$HOST_IP:$ETCD_PORT
fi


echo "[nginx] booting container. ETCD: http://$ETCD_ENDPOINT."


if [ ! -f "/etc/confd/confd.toml" ]; then
  confd -interval 10 -backend etcd -node http://$ETCD_ENDPOINT &
else
  confd &
fi


echo "[nginx] confd is now monitoring etcd for changes..."

# Start the Nginx service using the generated config
echo "[nginx] starting nginx service..."
#service nginx start --daemon off
exec nginx -g "daemon off;"
# Follow the logs to allow the script to continue running
#tail -f /var/log/nginx/*.log