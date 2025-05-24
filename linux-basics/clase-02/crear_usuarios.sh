#!/bin/bash

# Crear usuarios
echo "Creando usuarios..."
sudo adduser devops1 --gecos "" --disabled-password
sudo adduser devops2 --gecos "" --disabled-password
sudo adduser devopsadmin --gecos "" --disabled-password

# Crear grupo y asignar
sudo groupadd devops
sudo usermod -aG devops devops1
sudo usermod -aG devops devops2

# Dar permisos de sudo solo a devopsadmin
sudo usermod -aG sudo devopsadmin

echo "Usuarios y grupo creados correctamente."
