FROM n8nio/n8n:latest

USER root

# Instalar su-exec (n8nio/n8n en Docker Hub no lo trae por defecto)
RUN apk add --no-cache su-exec

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["n8n"]
