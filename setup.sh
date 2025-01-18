#!/bin/bash

# Variables
DOTFILES_DIR="$HOME/dotFiles"
BASH_DIR="$DOTFILES_DIR/bash"
NVIM_DIR="$DOTFILES_DIR/nvim"
TMUX_DIR="$DOTFILES_DIR/tmux"
WEZTERM_DIR="$DOTFILES_DIR/wezterm"

# Crear enlace simbólico para aliases.sh
echo "Creando enlace simbólico para aliases.sh..."
if [ -f "$BASH_DIR/aliases" ]; then
  if ! grep -q "source $HOME/dotFiles/bash/aliases" "$HOME/.bashrc"; then
    echo "source $HOME/dotFiles/bash/aliases" >>"$HOME/.bash_aliases"
    echo "Línea para cargar alias añadida a .bashrc."
  fi
  echo "aliases.sh cargado correctamente.🎉"
fi

# Crear enlace simbólico para nvim
echo "Creando enlace simbólico para nvim..."
if [ -d "$NVIM_DIR" ]; then
  ln -sf "$NVIM_DIR" "$HOME/.config/nvim"
  echo "nvim enlace simbólico creado correctamente.🎉"
fi

# Crear enlace simbólico para tmux
echo "Creando enlace simbólico para tmux..."
if [ -d "$TMUX_DIR" ]; then
  mkdir -p "$HOME/.config" # Asegura que ~/.config existe
  ln -sfn "$TMUX_DIR" "$HOME/.config/tmux"
  echo "Enlace simbólico para la carpeta tmux creado correctamente. 🎉"
else
  echo "La carpeta $TMUX_DIR no existe. ❌"
fi

# Crear enlace simbólico para wezterm (carpeta completa)
echo "Creando enlace simbólico para wezterm..."
if [ -d "$WEZTERM_DIR" ]; then
  ln -sf "$WEZTERM_DIR" "$HOME/.config/wezterm"
  echo "La carpeta wezterm enlace simbólico creado correctamente.🎉"
fi

echo "🚀🚀🚀¡Dotfiles configurados correctamente!"
