# Dotfiles Configuration ✨

This repository contains my personal configurations for various tools and applications,
organized for easy setup and management across systems using `stow`.

## Overview 🌟

- **Neovim** (`nvim`): Native `vim.pack` based configuration with the built-in LSP client.
- **Tmux** (`tmux`): Config split into modules (theme, statusline, utility), plugins managed by TPM.
- **Ghostty** (`ghostty`): Terminal config, including a custom cursor smear shader.

## 📁 Structure

```plaintext
dotFiles/
├── ghostty/    # Ghostty configuration and shaders
├── nvim/       # Neovim configuration
└── tmux/       # tmux configuration
```

Each folder mirrors the home directory layout (e.g. `nvim/.config/nvim`), so `stow`
can symlink it into place.

## 🚀 Installation

### 1. Install GNU Stow 📦

```bash
# macOS
brew install stow

# On Debian/Ubuntu
sudo apt install stow

# On Arch Linux
sudo pacman -S stow
```

### 2. Clone the Repository 💍

Clone the repository to your home directory:

```bash
git clone git@github.com:kete102/dotFiles.git ~/dotFiles
```

### 3. Use Stow to Apply Configurations 🛠️

```bash
cd ~/dotFiles
stow nvim
stow tmux
stow ghostty
```

This will:

- Link Neovim configurations to `~/.config/nvim` 📝
- Link tmux configurations to `~/.config/tmux` 🛋️
- Link Ghostty configurations to `~/.config/ghostty` 👻

### 4. Install tmux plugins 🔌

Plugins are not stored in this repo. Install [TPM](https://github.com/tmux-plugins/tpm)
where `tmux.conf` expects it, then press `prefix + I` inside tmux:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## 🎨 Customization

Feel free to modify any configuration files to suit your needs. Each tool's configuration
folder is self-contained, making it easy to update or replace as required.

## 🤝 Contributions

If you'd like to suggest improvements, feel free to open a pull request or issue.
You can also fork this repository to create and manage your own custom configurations.
This setup is tailored to my preferences, but I welcome feedback and ideas!

---

Happy coding! 🚀
