#!/bin/sh
set -e

# Railway monta /data como root; n8n corre como node (uid 1000)
mkdir -p /data
chown -R node:node /data 2>/dev/null || true

# Ejecutar n8n como user node (usa su-exec en Alpine o gosu en Debian)
if command -v su-exec >/dev/null 2>&1; then
    exec su-exec node "$@"
elif command -v gosu >/dev/null 2>&1; then
    exec gosu node "$@"
else
    exec "$@"
fi
