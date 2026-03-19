# 🛠️ scripts

Repositorio personal de scripts para automatizar tareas, mejorar productividad y facilitar flujos de trabajo en 
la terminal.
Diseñado especialmente para macOS.

## 📂 Contenido

Actualmente incluye:

- `bytes2human.sh`: Convierte bytes a un formato legible (KB, MB, GB, TB, etc.)
- `respaldo-espejo.sh`: Crea un respaldo (on premise) entre un directorio específico y un dispositivo externo. 
_PD: Si la ruta de $origen o $destino no termina en "/" se le concatena una automáticamente_.
- `pdfconverter`: _(Necesitas tener LibreOffice para usar este script https://www.libreoffice.org/)_. Convierte 
archivos (pptx, docx) a .pdf por lote poniéndo los archivos convertidos dentro de una carpeta llamado 
_"pdf-convertido"_.

## 🚀 Uso

1. Permisos de ejecución:

El instalador (install.sh) del doftile ya debería haber dado los persmisos necesarios de ejecución, de no ser así ejecuta:
ejecuta: chmod +x ~/dotfiles/bin/*

2. Otorgar ruta PATH en .zshrc:

El archivo zshrc del dotfile ya debería traer la ruta, de no ser así agrega la siguiente línea:
export PATH="$HOME/dotfiles/bin:$PATH"

