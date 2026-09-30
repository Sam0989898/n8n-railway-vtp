FROM n8nio/n8n:latest

USER root

# n8nio/n8n en Docker Hub está basada en Alpine sí, pero el error decía apk not found.
# Puede que la imagen sea distroless o minimal. Detectamos y usamos lo que haya.
RUN if command -v apk >/dev/null 2>&1; then \
        apk add --no-cache su-exec; \
    elif command -v apt-get >/dev/null 2>&1; then \
        apt-get update && apt-get install -y --no-install-recommends gosu && rm -rf /var/lib/apt/lists/*; \
    else \
        echo "No package manager found (neither apk nor apt-get)"; \
        exit 1; \
    fi

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["n8n"]
