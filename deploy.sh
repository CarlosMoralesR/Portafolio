#!/bin/bash

# Parar nginx y ngrok
sudo service nginx stop
killall ngrok

# Tomar los ultimos cambios del repositorio
git pull

# Encender nginx
sudo service nginx start

# Encender ngrok en el background y desplegar el url publico
nohup ngrok http 80 > /dev/null 2>&1 &
sleep 2
echo "URL Publico: $(curl -s http://localhost:4040/api/tunnels | jq -r .tunnels[0].public_url)"

