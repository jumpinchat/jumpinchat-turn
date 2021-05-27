#!/bin/bash

echo "starting turn server"
CONFIG_PATH=/etc/turnserver.conf

echo listening-ip=${EXTERNAL_IP} >> ${CONFIG_PATH}

exec /usr/bin/turnserver
