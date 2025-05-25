# Clase 04 - Logs, Monitoreo y Estado del Sistema

## 🎯 Objetivos de la clase

* Comprender cómo monitorear el estado del sistema en tiempo real
* Aprender a trabajar con logs de sistema usando `journalctl`
* Evaluar el uso del disco, RAM y swap
* Instalar y usar herramientas como `du`, `df`, `free`, `iotop`, `ncdu`

---

## 🧰 Comandos ejecutados y explicados

### 📒 Ver logs del sistema con `journalctl`

```bash
sudo journalctl                      # Ver logs del sistema completo
sudo journalctl -xe                 # Ver errores detallados recientes
sudo journalctl -u servicio         # Ver logs de un servicio específico
sudo journalctl --since today       # Logs desde hoy
sudo journalctl -b                  # Logs desde el último boot
```

> `journalctl` usa el backend de `systemd` para mostrar mensajes de servicios, errores, kernel, etc.

---

### 💽 Espacio en disco

```bash
df -h                  # Ver uso de disco por sistema de archivos
sudo du -sh /ruta      # Ver peso de una carpeta (resumen)
sudo du -sh *          # Ver tamaño de cada subdirectorio
```

> `df` muestra cuánto espacio libre y usado hay por partición.
> `du` muestra cuánto espacio ocupa una carpeta o archivo en el disco.

---

### 🧠 Uso de memoria y swap

```bash
free -h                # Ver memoria RAM y swap usada/libre
top                    # También muestra uso de RAM en tiempo real
```

> `free` divide entre memoria en uso, en caché, libre y la usada como swap (disco).

---

### 📈 Monitoreo en tiempo real con `iotop` y `ncdu`

#### `iotop`: monitoreo de disco por proceso

```bash
sudo apt install iotop
sudo iotop
```

> Muestra qué procesos están leyendo/escribiendo en el disco.

#### `ncdu`: explorador visual de espacio en disco

```bash
sudo apt install ncdu
sudo ncdu /
```

> Permite navegar por carpetas y ver cuál ocupa más espacio. Muy útil para VPS.

---

## 🧪 Tareas prácticas

### 🧩 Ejercicio 1: Ver logs recientes del sistema

```bash
sudo journalctl -xe
sudo journalctl --since "1 hour ago"
```

> Analizá si hubo errores de red, de servicios, etc. ¿qué significan?

### 🧩 Ejercicio 2: Logs de un servicio creado (de clase 3)

```bash
sudo journalctl -u servicio-ejemplo
```

> Confirmá que esté escribiendo al log correctamente

### 🧩 Ejercicio 3: Analizar espacio en disco

```bash
df -h
sudo du -sh /var/log
```

> Evaluá si `/var/log` o `/tmp` están ocupando demasiado espacio

### 🧩 Ejercicio 4: Navegar disco con `ncdu`

```bash
sudo ncdu /
```

> Identificá qué carpetas usan más espacio (ideal si tu VPS se está llenando)

### 🧩 Ejercicio 5: Ver uso de RAM y swap

```bash
free -h
top
```

> ¿Tenés mucha swap activa? Puede indicar que el sistema se quedó sin RAM

---

## 🧠 Reflexiones

* `journalctl` es el mejor amigo para debuggear servicios y problemas del sistema.
* `du` y `ncdu` son clave para limpiar y entender el espacio de tu VPS.
* `free` + `top` ayudan a entender cómo se comporta el sistema bajo carga.

---

## 🧭 Qué sigue (Clase 05)

> Networking en Linux: interfaces, IP, DNS, rutas, `netstat`, `ss`, `ip`, `ping`, `nmap`, `iptables`.
