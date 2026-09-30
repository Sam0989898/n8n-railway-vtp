#!/bin/sh
set -e

# Railway monta /data como root; n8n corre como node (uid 1000)
mkdir -p /data
chown -R node:node /data 2>/dev/null || true

exec su-exec node "$@"
