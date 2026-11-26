#!/usr/bin/env bash
# Bootstrap a machine: install packages, then symlink the dotfiles with stow.
# Supports macOS (Homebrew) and Debian/Ubuntu-based Linux (Pop!_OS, apt).
#
# Usage: ./install.sh [--no-packages]
#   --no-packages   only run stow, skip package installation
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STOW_PACKAGES=(nvim tmux ghostty zsh git)
STOW_NO_FOLDING_PACKAGES=(opencode)

log() { printf '\n==> %s\n' "$*"; }
have() { command -v "$1" >/dev/null 2>&1; }

install_macos() {
  if ! have brew; then
    log "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  log "Installing Homebrew packages"
  brew install stow neovim tmux lazygit ripgrep fd fzf gh fnm pyenv zsh
  brew install --cask ghostty font-iosevka-term-nerd-font
}

install_linux() {
  have apt-get || { echo "Only apt-based distros are supported by this script." >&2; exit 1; }
  local arch
  case "$(uname -m)" in
    x86_64) arch=x86_64 ;;
    aarch64 | arm64) arch=arm64 ;;
    *) echo "Unsupported architecture: $(uname -m)" >&2; exit 1 ;;
  esac

  log "Installing apt packages"
  local clipboard=xclip
  [ -n "${WAYLAND_DISPLAY:-}" ] && clipboard=wl-clipboard
  sudo apt-get update
  sudo apt-get install -y stow tmux ripgrep fd-find fzf git curl zsh unzip \
    build-essential nodejs npm "$clipboard"

  # apt ships an old Neovim; the config needs 0.12+ (vim.pack, vim.lsp.config).
  if ! have nvim || ! nvim --version | head -1 | grep -qE 'v0\.(1[2-9]|[2-9][0-9])|v[1-9]'; then
    log "Installing Neovim (latest release)"
    local nvim_pkg="nvim-linux-${arch}"
    curl -fsSL "https://github.com/neovim/neovim/releases/latest/download/${nvim_pkg}.tar.gz" |
      sudo tar -xz -C /opt
    sudo ln -sf "/opt/${nvim_pkg}/bin/nvim" /usr/local/bin/nvim
  fi

  if ! have lazygit; then
    log "Installing lazygit (latest release)"
    local version
    version="$(curl -fsSL https://api.github.com/repos/jesseduffield/lazygit/releases/latest |
      sed -n 's/.*"tag_name": *"v\([^"]*\)".*/\1/p')"
    curl -fsSL "https://github.com/jesseduffield/lazygit/releases/download/v${version}/lazygit_${version}_Linux_${arch}.tar.gz" |
      sudo tar -xz -C /usr/local/bin lazygit
  fi

  # Debian/Ubuntu name the fd binary fdfind.
  if have fdfind && ! have fd; then
    mkdir -p "$HOME/.local/bin"
    ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
  fi

  echo "Not installed automatically: Ghostty (https://ghostty.org/docs/install/binary)"
  echo "and the IosevkaTerm Nerd Font (https://www.nerdfonts.com/font-downloads)."
}

install_common() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    log "Installing Oh My Zsh"
    RUNZSH=no KEEP_ZSHRC=yes sh -c \
      "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  fi
  if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    log "Installing TPM (tmux plugin manager)"
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  fi
}

stow_all() {
  log "Linking dotfiles with stow"
  cd "$DOTFILES"
  stow --restow --target="$HOME" "${STOW_PACKAGES[@]}"
  stow --restow --no-folding --target="$HOME" "${STOW_NO_FOLDING_PACKAGES[@]}"
}

if [ "${1:-}" != "--no-packages" ]; then
  case "$(uname -s)" in
    Darwin) install_macos ;;
    Linux) install_linux ;;
    *) echo "Unsupported OS: $(uname -s)" >&2; exit 1 ;;
  esac
  install_common
fi

stow_all

log "Done"
echo "If stow reported conflicts, move the existing files away (or run: stow --adopt <package>) and re-run."
echo "Start tmux and press prefix + I to install tmux plugins. Open nvim once to install plugins."
