#!/bin/bash
CONFIG_PATH=/etc/turnserver.conf

cat << EOF > $CONFIG_PATH
listening-port=3478
tls-listening-port=5349
realm=example.com
lt-cred-mech
use-auth-secret
static-auth-secret=somesecret
cert=/etc/certs/fullchain.pem
pkey=/etc/certs/privkey.pem
dh-file=/etc/certs/dhparam.pem
proc-user=turnserver
proc-group=turnserver
cipher-list="TLS_AES_256_GCM_SHA384:TLS_CHACHA20_POLY1305_SHA256:TLS_AES_128_GCM_SHA256:DHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-SHA256:DHE-RSA-AES128-SHA256:ECDHE-RSA-AES256-SHA384:ECDHE-RSA-AES128-SHA256"
web-admin
EOF
