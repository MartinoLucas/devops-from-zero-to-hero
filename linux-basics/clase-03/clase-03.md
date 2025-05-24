# Clase 03 - Gestión de Procesos, Señales, Cron y Systemd

## 🎯 Objetivos de la clase

* Comprender cómo visualizar y gestionar procesos en Linux
* Enviar señales a procesos con `kill`, `pkill`, `killall`
* Controlar prioridad y consumo con `nice` y `renice`
* Automatizar tareas con `cron`
* Introducción a `systemd` y servicios en segundo plano

---

## 🔍 Comandos ejecutados y explicados

### 👁️ Visualizar procesos

```bash
ps aux                 # Lista todos los procesos detalladamente
ps -ef                 # Formato alternativo (estándar UNIX)
top                    # Vista interactiva en tiempo real
htop                   # (si está instalado) interfaz mejorada
```

### 🧨 Señales a procesos

```bash
kill PID               # Enviar señal (por defecto SIGTERM) al proceso
kill -9 PID            # Enviar SIGKILL (forzado, no recomendado siempre)
pkill nombre_proceso   # Matar procesos por nombre
killall nombre         # Igual que pkill pero afecta todos los usuarios
```

### 🔄 Cambiar prioridad

```bash
nice -n 10 comando     # Ejecuta un comando con menor prioridad
renice -n 5 -p PID     # Cambia prioridad de un proceso ya en ejecución
```

> El valor de `nice` va de -20 (más prioritario) a 19 (menos prioridad)
> `-n` indica el valor de prioridad que se quiere asignar.
> `-p` en `renice` indica que se actúa sobre un proceso existente, al que se lo identifica por su PID.

### 🕒 Tareas programadas con `cron`

```bash
crontab -e             # Editar cronjobs del usuario actual
crontab -l             # Ver cronjobs
crontab -r             # Eliminar cronjobs
```

Ejemplo de tarea en `crontab`:

```
*/10 * * * * /home/lucas/scripts/backup.sh
```

> Ejecuta `backup.sh` cada 10 minutos

### ⚙️ Introducción a `systemd`

```bash
systemctl status nombre_servicio   # Estado del servicio
systemctl start nombre             # Iniciar servicio
systemctl stop nombre              # Detenerlo
systemctl enable nombre            # Inicia en cada boot
systemctl disable nombre           # No arranca al iniciar
```

Ejemplo de unit file:

```ini
[Unit]
Description=Mi servicio custom

[Service]
ExecStart=/usr/bin/python3 /home/lucas/app.py
Restart=always

[Install]
WantedBy=multi-user.target
```

Colocarlo en `/etc/systemd/system/miservicio.service` y luego:

```bash
sudo systemctl daemon-reexec
sudo systemctl enable --now miservicio
```

---

## 🧪 Tareas prácticas

### 🧩 Ejercicio 1: Observación de procesos

**Objetivo**: familiarizarse con las herramientas `ps`, `top`, `htop` y comprender la información de cada proceso.

**Pasos:**

1. Ejecutar:

```bash
ps aux | less
```

2. Identificar columnas como `USER`, `PID`, `%CPU`, `STAT`, `COMMAND`
3. Ejecutar `top` y observar cómo cambia la carga del sistema.
4. Instalar y ejecutar `htop` si no lo tenés:

```bash
sudo apt install htop
htop
```

**Resultado esperado**: comprensión básica de qué procesos están corriendo, cuánta CPU/memoria consumen y cómo priorizarlos visualmente.

---

### 🧩 Ejercicio 2: Manejo de procesos y señales

**Objetivo**: aprender a enviar señales a procesos manualmente.

**Pasos:**

1. Ejecutar un proceso en segundo plano:

```bash
sleep 1000 &
```

2. Ver el PID con `ps` o `jobs`, luego matarlo con:

```bash
kill PID
```

3. Repetir pero con `kill -9 PID` y luego con:

```bash
pkill sleep
```

**Resultado esperado**: comprensión de qué diferencia hay entre `SIGTERM` y `SIGKILL`, y cómo identificar procesos por nombre o PID.

---

### 🧩 Ejercicio 3: Cronjob simple

**Objetivo**: crear una tarea automatizada.

**Pasos:**

1. Crear un script en `/home/tu_usuario/testcron.sh`:

```bash
#!/bin/bash
echo "Cron ejecutado a las $(date)" >> /tmp/cron.log
```

2. Darle permisos:

```bash
chmod +x ~/testcron.sh
```

3. Agregar al cron:

```bash
crontab -e
# Agregar esta línea:
* * * * * /home/tu_usuario/testcron.sh
```

**Resultado esperado**: cada minuto se agregará una línea con la hora actual a `/tmp/cron.log`. Verificá con:

```bash
tail -f /tmp/cron.log
```

---

### 🧩 Ejercicio 4: Crear servicio con systemd

**Objetivo**: ejecutar y mantener un script persistente como servicio.

**Pasos:**

1. Crear un script simple en `/home/tu_usuario/servicio.sh`:

```bash
#!/bin/bash
while true; do
  echo "Servicio activo - $(date)" >> /tmp/servicio.log
  sleep 5
done
```

2. Darle permisos:

```bash
chmod +x ~/servicio.sh
```

3. Crear archivo `/etc/systemd/system/servicio-ejemplo.service`:

```ini
[Unit]
Description=Servicio de prueba

[Service]
ExecStart=/home/tu_usuario/servicio.sh
Restart=always

[Install]
WantedBy=multi-user.target
```

4. Activar el servicio:

```bash
sudo systemctl daemon-reexec
sudo systemctl enable --now servicio-ejemplo
```

**Resultado esperado**: un proceso que se ejecuta indefinidamente y escribe en `/tmp/servicio.log`. Deberías ver nuevas líneas cada 5 segundos.

---

## 🧠 Reflexiones

* `kill` no significa “forzar” siempre. Usar `SIGTERM` primero y `SIGKILL` si no responde.
* `cron` es ideal para tareas de mantenimiento automatizado.
* `systemd` es esencial para servicios persistentes en producción.

---

## 🧭 Qué sigue (Clase 04)

> Logs, monitoreo con `journalctl`, espacio en disco, RAM, swap, y herramientas como `ncdu`, `iotop`, `du`, `df`, `free`.
