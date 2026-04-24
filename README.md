# 💻 Dotfiles - MacBook Pro Sonoma (Intel)

> Entorno de desarrollo optimizado para **macOS Sonoma** (vía OCLP) en arquitectura Intel.

![macOS](https://img.shields.io/badge/OS-Sonoma%2014.0-blue?logo=apple) ![Shell](https://img.shields.io/badge/Shell-Zsh-orange?logo=zsh) ![Hardware](https://img.shields.io/badge/Hardware-MBP%202012-lightgrey)

Este repositorio contiene mis archivos de configuración personal, scripts de automatización y la lista de aplicaciones para mi entorno de desarrollo princupalmente en **macOS Sonoma**.

# 🚀 Instalación Rápida

Para desplegar esta configuración en una instalación limpia de macOS, abre la terminal y ejecuta:

```bash
# 1. Crear la carpeta donde sea alojará el repositorio:
mkdir ~/dotfiles
cd ~/dotfiles
```

2. Descarga el ZIP del repositorio en tu ubicación actual:
   (link aquí)

```bash
# 3. Dar permisos y ejecutar el instalador:
chmod +x install.sh
./install.sh
```

_Pd. los symlinks del instalador tienen las rutas de la arquitectura Intel por defecto, cambiar a ARM cuando sea necesario._

- Tema para Ghostty por defecto en zshrc 'iterm2':
  `<img src="img/tema-zsh.png" alt="tema oh-my-posh">`

## 📁️ Carpeta /bin/

Para leer contenido ejecutar: nano ~/dotfiles/bin/README.md

## 📂 Carpeta /docker-templates/

Incluye los docker-compose.yml para proyectos de desarrollo de software.

## ❗️IMPORTANTE

- Para usar tus credenciales para gh y rclone descargar desde la ubicación personal: ☁️(icloud drive) > credenciales-dev
- La app OrbStack v1.5.1 se instaló manualmente debido a la arquitectura Intel [descargar aquí](https://docs.orbstack.dev/downgrade).

```bash
# Si tu arquitectura es ARM (version apple M) instala desde brew:
brew install --cask orbstack
```

## 🤝 Créditos y Agradecimientos

Este entorno de desarrollo es posible gracias al increíble trabajo de las siguientes comunidades:

* **[OpenCore Legacy Patcher](https://dortania.github.io/OpenCore-Legacy-Patcher/)**: Por permitir que este MacBook Pro Legacy corra macOS Sonoma con un rendimiento excepcional.
* **[Homebrew](https://brew.sh/)**: El gestor de paquetes que mantiene mi sistema organizado.
* **[Ghostty](https://ghostty.org/)**: Por crear la terminal más rápida y estética que he probado.

Repo en desarrollo... hecho con ☕ y perseverancia por **Mario Haro**.
