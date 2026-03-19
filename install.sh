#!/bin/bash

# --- CONFIGURACIÓN ---
DOTFILES_DIR="$HOME/dotfiles"
# usaremos la ruta dada por la instalación (la ruta estandar es $HOME/.config/ghostty)
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"

# Colores para la terminal
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${BLUE}🚀 Iniciando instalación limpia de Dotfiles...${NC}\n"

# --- 1. VERIFICACIÓN DE HOMEBREW ---
if ! command -v brew &> /dev/null; then
    echo -e "${YELLOW}🍺 Homebrew no detectado. Instalando...${NC}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Configurar brew en el path actual para la sesión de instalación
    eval "$(/usr/local/bin/brew shellenv)"
else
    echo -e "${GREEN}✅ Homebrew ya está instalado.${NC}"
fi

# --- 2. EJECUCIÓN DEL BREWFILE ---
if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    echo "📦 Instalando dependencias desde Brewfile..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
else
    echo -e "${YELLOW}⚠️ No se encontró Brewfile en $DOTFILES_DIR. Saltando...${NC}"
fi

# --- 3. CREACIÓN DE ENLACES SIMBÓLICOS (SYMLINKS) ---
echo -e "\n${BLUE}🔗 Vinculando archivos de configuración...${NC}"

# Función robusta para symlinks con backup (.bak)
create_link() {
    local source_file=$1
    local target_file=$2

    # Crear carpeta contenedora si no existe
    mkdir -p "$(dirname "$target_file")"

    # Si ya existe un archivo o link, crear backup en lugar de borrar
    if [ -e "$target_file" ] || [ -L "$target_file" ]; then
        mv "$target_file" "${target_file}.bak"
        echo -e "   📦 Backup creado: ${target_file}.bak"
    fi

    ln -s "$source_file" "$target_file"
    echo -e "   ✅ Vinculado: $target_file"
}

# Ejecutar vinculaciones
create_link "$DOTFILES_DIR/zshrc" "$HOME/.zshrc"
create_link "$DOTFILES_DIR/gitconfig" "$HOME/.gitconfig"
create_link "$DOTFILES_DIR/config.ghostty" "$GHOSTTY_CONFIG_DIR/config"

# --- 4. PERMISOS Y SCRIPTS ---
echo -e "\n${BLUE}🛠️ Configurando scripts personales...${NC}"
if [ -d "$DOTFILES_DIR/bin" ]; then
    chmod +x "$DOTFILES_DIR"/bin/*
    echo -e "   ✅ Permisos de ejecución concedidos en ~/dotfiles/bin/"
else
    echo -e "   ⚠️ Carpeta /bin no encontrada."
fi

# --- FINALIZACIÓN ---
echo -e "\n${GREEN}✨ ¡Todo listo, Mario!${NC}"
echo -e "💡 Sugerencia: Ejecuta 'source ~/.zshrc' o reinicia Ghostty para aplicar los cambios."
