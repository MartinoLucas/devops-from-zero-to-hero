# DevOps from Zero to Hero - Lucas Martino

Este repositorio documenta mi progreso real como DevOps Engineer, desde fundamentos de Linux hasta prácticas avanzadas con Docker, Kubernetes, CI/CD y Cloud Computing. Está diseñado como un diario técnico estructurado, con teoría aplicada, comandos reales, buenas prácticas y reflexiones. Mi objetivo: convertirme en un DevOps profesional capaz de diseñar, mantener y escalar infraestructuras robustas en la nube.

---

## 🧭 Roadmap General

### 🔹 1. Fundamentos Linux (Núcleo del sistema DevOps)

* Comandos esenciales (navegación, manipulación de archivos, permisos, procesos)
* Gestión de usuarios y grupos
* Networking en Linux (IP, DNS, netstat, iptables)
* Cronjobs, systemd, logs, monitoreo básico
* Shell scripting
* Seguridad (sudo, ssh, firewall básico)

### 🔹 2. Control de Versiones con Git

* Buenas prácticas de Git para proyectos DevOps
* Uso de GitHub para flujos colaborativos
* Git tags y versiones
* GitHub Actions: introducción a CI/CD

### 🔹 3. Docker y Contenedores

* Imágenes, contenedores y redes
* Dockerfile y docker-compose
* Volúmenes y persistencia
* Multi-container apps
* Seguridad y optimización

### 🔹 4. CI/CD - Integración y Despliegue Continuo

* Fundamentos de pipelines
* GitHub Actions: Workflows, triggers, jobs
* Testeo automatizado
* Deploy automático por SSH a VPS (con PNPM y Next.js, si aplica)

### 🔹 5. Infraestructura como Código

* Introducción a Terraform y Ansible
* Provisionamiento de servidores
* Infra reproducible en la nube

### 🔹 6. Kubernetes (K8s)

* Pods, deployments, services, ingress
* Helm y configuración avanzada
* Minikube vs clúster real
* Escalado, self-healing, observabilidad

### 🔹 7. Cloud Platforms

* AWS: EC2, S3, IAM, CloudWatch, Route53
* GCP y Azure (breve comparación y casos de uso)
* Despliegue multi-nube y enfoque vendor-neutral

---

## 🗂️ Estructura del Repositorio

```bash
📁 devops-from-zero-to-hero/
├── README.md               # Este documento general
├── linux-basics/          # Clases y prácticas de Linux
│   ├── clase-01.md
│   ├── clase-02.md
├── git-versioning/
│   └── clase-01.md
├── docker/
│   └── clase-01.md
├── cicd/
├── k8s/
├── cloud-aws/
├── terraform-ansible/
└── recursos/              # Cheatsheets, links útiles, plantillas
```

Cada carpeta incluye:

* `clase-X.md`: lo aprendido, comandos usados, problemas encontrados, reflexiones personales.
* Archivos auxiliares `.sh`, `.yml`, `.tf`, `.yaml`, etc.

---

## 🎯 Objetivo Profesional

Convertirme en DevOps Engineer certificado, experto en buenas prácticas, automatización de infraestructura, y capaz de tomar decisiones técnicas robustas en entornos productivos con alta demanda.

---

## 📚 Recursos y Referencias

* [Awesome DevOps](https://github.com/serious-scribbler/awesome-devops)
* [Linux Journey](https://linuxjourney.com/)
* [Docker Docs](https://docs.docker.com/)
* [Kubernetes Docs](https://kubernetes.io/docs/)
* [GitHub Actions](https://docs.github.com/en/actions)
* [AWS Docs](https://docs.aws.amazon.com/)

---

## 🧠 Licencia y Filosofía

Todo el contenido de este repositorio es de libre acceso y fue creado con fines educativos y profesionales. Mi intención es compartir el aprendizaje de forma estructurada, realista y profesional, desde cero.

> *"Learning by doing, growing by sharing."*
