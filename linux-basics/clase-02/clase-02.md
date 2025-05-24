# Clase 02 - Gestión de Usuarios, Grupos y Sudo en Linux

## 🎯 Objetivos de la clase

* Entender cómo funciona la gestión de usuarios y grupos en Linux
* Crear, modificar y eliminar usuarios y grupos
* Comprender los archivos `/etc/passwd`, `/etc/shadow` y `/etc/group`
* Configurar el uso de `sudo` de forma segura y con buenas prácticas

---

## 📁 Comandos clave usados en la clase

### 👤 Usuarios

```bash
adduser nombre             # Crear usuario con home y configuraciones
useradd -m nombre          # Alternativa más manual
passwd nombre              # Establecer o cambiar contraseña
usermod -aG grupo nombre   # Agregar usuario a un grupo adicional
id nombre                  # Ver UID, GID y grupos
```

### 👥 Grupos

```bash
groupadd grupo             # Crear grupo
groupdel grupo             # Borrar grupo
gpasswd -d nombre grupo    # Quitar usuario de grupo
groups nombre              # Ver grupos del usuario
```

### 🔐 Archivos de configuración

* `/etc/passwd`: información básica del usuario
* `/etc/shadow`: contraseñas encriptadas y caducidad
* `/etc/group`: relación entre grupos y usuarios

### ⚙️ Sudo y permisos

```bash
sudo comando               # Ejecutar comando como root (si estás autorizado)
sudo -i                    # Obtener una shell root temporal
visudo                     # Editar el archivo de sudo de forma segura
```

---

## 🧪 Ejercicios propuestos

1. Crear tres usuarios: `devops1`, `devops2`, `devopsadmin`
2. Crear un grupo llamado `devops`
3. Agregar a `devops1` y `devops2` al grupo `devops`
4. Dar permisos de sudo solo a `devopsadmin`
5. Probar que los usuarios `devops1` y `devops2` no puedan usar `sudo`
6. Verificar contenido de `/etc/passwd`, `/etc/shadow`, `/etc/group`

---

## 🛠️ Script auxiliar: crear\_usuarios.sh

```bash
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
```

> 🔒 Este script debe ejecutarse con permisos administrativos. Podés correrlo con:

```bash
chmod +x crear_usuarios.sh
sudo ./crear_usuarios.sh
```

---

## 🧠 Reflexiones

* Es clave entender el archivo `/etc/sudoers` y no editarlo directamente. Usar `visudo`.
* Un usuario puede estar en varios grupos secundarios, pero solo uno principal.
* La gestión correcta de permisos evita errores graves de seguridad.

---

## 🧭 Qué sigue (Clase 03)

> Procesos, señales, `ps`, `kill`, `top`, `htop`, `nice`, `cron`, y `systemd`.
