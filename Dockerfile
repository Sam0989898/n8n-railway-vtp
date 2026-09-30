FROM docker.n8n.io/n8nio/n8n:latest

USER root

# Al arrancar, aseguramos que /data (volumen de Railway) sea escribible por node
# y ejecutamos n8n como user node (no como root, por seguridad).
ENTRYPOINT ["/bin/sh", "-c", "mkdir -p /data && chown -R node:node /data && exec su-exec node n8n"]
