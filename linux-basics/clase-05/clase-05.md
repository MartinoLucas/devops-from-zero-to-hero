# Clase 05 - Networking en Linux: Comandos clave y Diagnóstico de red

## 🎯 Objetivos de la clase

* Comprender la configuración y el estado de las interfaces de red
* Diagnosticar conectividad y rutas
* Aprender a utilizar herramientas como `ip`, `ping`, `traceroute`, `ss`, `netstat`, `dig`, y `nmap`
* Introducción básica a `iptables`

---

## 📡 Comandos ejecutados y explicados

### 🌐 Ver interfaces de red y direcciones IP

```bash
ip a                  # Lista interfaces y direcciones IP asignadas
ip link               # Lista solo interfaces (estado: UP/DOWN)
ip route              # Muestra tabla de rutas del sistema
ip -s link            # Estadísticas por interfaz (bytes, errores, etc.)
```

> Reemplaza a `ifconfig`, que está obsoleto en muchas distros

---

### 📶 Comprobación de conectividad

```bash
ping -c 4 8.8.8.8     # Enviar 4 paquetes ICMP a Google DNS
ping dominio.com      # Comprobar si se resuelve y responde
```

```bash
traceroute google.com     # Ver la ruta que toma el paquete (instalar si falta)
sudo apt install traceroute
```

> `traceroute` muestra todos los nodos (routers) por los que pasa un paquete

---

### 🔍 Resolución de DNS

```bash
dig google.com            # Verifica resolución de nombres DNS
host google.com           # Alternativa simple
```

> Útil si ping a IP funciona pero a dominio no

---

### 🔗 Ver puertos y servicios activos

```bash
ss -tuln                  # Ver sockets activos (TCP/UDP)
ss -tunp                  # Igual, pero muestra PID y programa
```

> Reemplazo moderno de `netstat`. El flag `-tuln`:

* `t`: TCP, `u`: UDP, `l`: listening, `n`: numérico (no resolver nombres)

---

### 🔎 Escaneo de puertos y servicios (nmap)

```bash
sudo apt install nmap
nmap -sS -p 1-1000 localhost
```

> Muestra qué puertos están abiertos del sistema

---

### 🛡️ Introducción a iptables (solo diagnóstico)

```bash
sudo iptables -L -n -v       # Ver reglas activas y contadores
```

> `iptables` controla el firewall de Linux. En esta clase solo lo miramos.

---

## 🧪 Tareas prácticas

### 🧩 Ejercicio 1: Ver interfaces y rutas

```bash
ip a
ip route
```

> Explicá cuál es tu IP, cuál es tu puerta de enlace (gateway), y qué interfaz está activa

### 🧩 Ejercicio 2: Probar conectividad

```bash
ping -c 4 8.8.8.8
ping google.com
```

> Compará latencias. ¿Hay pérdida de paquetes?

### 🧩 Ejercicio 3: Ver ruta a destino

```bash
traceroute google.com
```

> Verificá en cuántos saltos se llega. ¿Alguno falla?

### 🧩 Ejercicio 4: Revisar DNS

```bash
dig github.com
```

> ¿A qué IP responde? ¿Qué servidor DNS se usó?

### 🧩 Ejercicio 5: Escanear puertos abiertos

```bash
ss -tuln
nmap -sS -p 22,80,443 localhost
```

> ¿Tenés algún puerto abierto? ¿Está nginx, ssh, etc. escuchando?

---

## 🧠 Reflexiones

* `ip` y `ss` son herramientas modernas que reemplazan a `ifconfig` y `netstat`
* `ping`, `dig` y `traceroute` son fundamentales para diagnosticar red
* `iptables` debe ser entendido con respeto, una regla mal escrita puede dejarte fuera de un servidor

---

## 🧭 Qué sigue (Clase 06)

> Seguridad básica: usuarios, permisos, `sudo`, UFW, fail2ban, claves SSH, buenas prácticas de hardening
