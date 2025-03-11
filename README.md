# Dotfiles Configuration ✨

This repository contains my personal configurations for various tools and applications,
organized for easy setup and management across systems using `stow`.

## Overview 🌟

- **Neovim (**`nvim`):
  Configuration files for Neovim.
- **Tmux**: Custom settings and plugins for tmux.
- **Alacritty**: Configuration for Alacritty terminal emulator.
- **Wezterm**: Configuration for Wezterm terminal emulator.

## 📁 Structure

```plaintext
.dotfiles/
├── alacritty/    # Alacritty configuration
├── wezterm/      # Wezterm configuration
├── nvim/         # Neovim configuration
├── tmux/         # tmux configuration and plugins
```

## 🚀 Installation

### 1. Install GNU Stow 📦

Make sure you have `stow` installed before proceeding:

```bash
# On Debian/Ubuntu
sudo apt install stow

# On Arch Linux
sudo pacman -S stow
```

### 2. Clone the Repository 💍

Clone the repository to your home directory:

```bash
git clone git@github.com:kete102/dotFiles.git
```

### 3. Use Stow to Apply Configurations 🛠️

Navigate to the dotfiles directory and run:

```bash
cd ~/dotfiles
stow alacritty
stow wezterm
stow nvim
stow tmux
```

This will:

- Link Neovim configurations to `~/.config/nvim` 📝
- Link tmux configurations to `~/.config/tmux` 🛋️
- Link Alacritty configurations to `~/.config/alacritty` 💻
- Link Wezterm configurations to `~/.config/wezterm` 🖥️

## 🎨 Customization

Feel free to modify any configuration files to suit your needs. Each tool's configuration
folder is self-contained, making it easy to update or replace as required.

## 🤝 Contributions

If you'd like to suggest improvements, feel free to open a pull request or issue.
You can also fork this repository to create and manage your own custom configurations.
This setup is tailored to my preferences, but I welcome feedback and ideas!

---

Happy coding! 🚀
