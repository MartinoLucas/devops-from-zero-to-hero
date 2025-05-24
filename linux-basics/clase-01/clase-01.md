# Clase 01 - Fundamentos de Linux: Navegación, Archivos y Permisos

## 🎯 Objetivos de la clase

* Reforzar los comandos básicos y medios de Linux
* Comprender el sistema de archivos Unix y su jerarquía
* Manipular archivos, carpetas y permisos desde terminal
* Empezar a documentar cada clase con comandos prácticos y explicaciones

---

## 📂 Creación de la carpeta y archivo

En tu terminal:

```bash
mkdir -p linux-basics/clase-01
cd linux-basics/clase-01
nano clase-01.md
```

O si usás VSCode:

```bash
mkdir -p linux-basics/clase-01 && code linux-basics/clase-01/clase-01.md
```

---

## 📘 Comandos básicos ejecutados y explicados

### 🔍 Navegación

```bash
pwd                  # Mostrar ruta actual
cd /ruta             # Ir a ruta absoluta
cd ..                # Subir un directorio
ls -lah              # Listado largo, ocultos y legible
```

### 🗂️ Archivos y directorios

```bash
touch archivo.txt           # Crear archivo vacío
mkdir nueva_carpeta         # Crear carpeta
mv archivo.txt carpeta/     # Mover archivo
cp archivo.txt copia.txt    # Copiar archivo
rm archivo.txt              # Borrar archivo
rmdir carpeta               # Eliminar carpeta vacía
```

### 🔐 Permisos

```bash
ls -l archivo.txt           # Ver permisos
chmod u+x script.sh         # Agregar permiso de ejecución al usuario
chmod 755 script.sh         # Permisos rwxr-xr-x
chown usuario:grupo file    # Cambiar dueño y grupo
```

### 🧪 Otros útiles

```bash
file archivo     # Tipo de archivo
df -h            # Espacio en disco
free -m          # RAM libre
top / htop       # Procesos activos
whoami           # Usuario actual
```

---

## 🧠 Reflexiones y apuntes personales

* `chmod` me sigue costando memorizarlo. Notar que 7=rwx, 5=rx, 0=---.
* Repasé la jerarquía de `/etc`, `/usr`, `/var`, `/home`, etc.:

  * `/etc`: contiene los archivos de configuración del sistema. Acá viven configuraciones de servicios como `sshd`, `nginx`, `network`, y más. Podés explorarlo con `ls /etc` o buscar archivos específicos con `find /etc -name '*ssh*'`.
  * `/usr`: alberga programas de usuario, bibliotecas y datos compartidos. Dentro de `/usr/bin` están la mayoría de los ejecutables de usuario. Usá `du -sh /usr/*` para ver el peso de cada subdirectorio.
  * `/var`: contiene archivos variables, como logs (`/var/log`), bases de datos, colas de correo, etc. Ideal para monitoreo y debugging. Explorá con `ls -lah /var/log`.
  * `/home`: guarda los directorios personales de cada usuario. Tus archivos, configuraciones personales y proyectos suelen estar en `/home/tu_usuario`.

Explorar estas carpetas con `tree -L 2 /` o `ncdu /` (si lo tenés instalado) ayuda a visualizarlas mejor.

* Me resulta cómodo moverme con `cd -` para volver al directorio anterior.
* Importante usar `-i` en `rm` para evitar borrar sin preguntar.

---

## ✅ Tareas prácticas

* Crear 5 archivos y carpetas, moverlos, renombrarlos y borrarlos
* Cambiar los permisos a modo ejecutable y probar con un script
* Documentar los comandos aprendidos y explicarlos con tus palabras

---

## 🧭 Qué sigue (Clase 02)

> Gestión de usuarios, grupos, permisos avanzados, sudoers y sudo
