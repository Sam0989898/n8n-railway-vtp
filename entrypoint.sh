#!/bin/sh
set -e

# Railway monta el volumen en /data como root; n8n corre como user node (uid 1000)
# Ajustamos permisos aquí y bajamos a user node antes de arrancar n8n
mkdir -p /data
chown -R node:node /data 2>/dev/null || true

# su-exec viene incluido en la imagen n8n (Alpine)
exec su-exec node "$@"
