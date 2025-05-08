#!/bin/bash

# Nombre del contenedor
CONTAINER_NAME="crafty_container"

# Esperar a que el contenedor esté activo
echo "⏳ Esperando a que el contenedor '$CONTAINER_NAME' esté corriendo..."
until [ "$(docker inspect -f '{{.State.Running}}' $CONTAINER_NAME 2>/dev/null)" == "true" ]; do
    sleep 1
done

# Verificar que el archivo existe y extraer la contraseña
echo "📦 Obteniendo credenciales iniciales de Crafty..."
docker exec -it $CONTAINER_NAME cat /crafty/app/config/default-creds.txt
