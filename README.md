# n8n para Railway (VoiceToPhone)

Imagen custom de n8n que arregla el problema de permisos del volumen persistente
de Railway.

Railway monta el volumen como `root:root`. n8n corre como user `node` (uid 1000)
y falla al intentar escribir. Este Dockerfile hace `chown` del volumen al
arrancar el contenedor (como root) y luego baja privilegios a `node` con
`su-exec` antes de ejecutar n8n.

Usada por: `integraciones.voicetophone.com`
