FROM docker.n8n.io/n8nio/n8n:latest

USER root

# Copiar script de entrada que arregla permisos y baja a user node
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["n8n"]
