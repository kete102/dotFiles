# Dotfiles Configuration ✨

This repository contains my personal configurations for various tools and applications, organized for easy setup and management across systems.

## Overview 🌟

- **\*\*Neovim (**\`nvim\`**)\*\***: Configuration files for Neovim.
- **\*\*Tmux**:\*\* Custom settings and plugins for tmux.
- **\*\*WezTerm**:\*\* Configuration for WezTerm terminal emulator.
- **\*\*Bash Aliases**:\*\* Common aliases to improve command-line productivity.

## 📁 Structure 

```plaintext
.dotFiles/
├── aliases.sh    # Aliases for Bash
├── nvim/         # Neovim configuration
├── tmux/         # tmux configuration and plugins
├── wezterm/      # WezTerm configuration
└── setup.sh      # Script to create symbolic links and set up configs
```

## 🚀 Installation

### 1. Clone the Repository 📥

Clone the repository to your home directory:

```bash
git clone https://github.com/<your-username>/dotFiles.git ~/dotFiles
```

### 2. Run the Setup Script 🛠️

The `setup.sh` script creates symbolic links to the appropriate locations in your system:

```bash
cd ~/dotFiles
chmod +x setup.sh
./setup.sh
```

This will:

- Link Neovim configurations to `~/.config/nvim`📝
- Link tmux configurations to `~/.config/tmux`📦
- Link WezTerm configurations to `~/.config/wezterm`💻
- Add aliases to your `~/.bashrc` ⚡

### 3. Reload Bash Configuration 🔄

After running the setup, reload your `~/.bashrc` to apply the aliases:

```bash
source ~/.bashrc
```

## 🚫 Ignoring tmux Plugins

The `/tmux/plugins` directory is excluded from version control to avoid tracking plugin files. This is managed via the `.gitignore` file:

```plaintext
tmux/plugins/
!tmux/
```

You can install tmux plugins separately using your preferred plugin manager.

## 🎨 Customization

Feel free to modify any configuration files to suit your needs. Each tool's configuration folder is self-contained, making it easy to update or replace as required.

## 🤝 Contributions

If you'd like to suggest improvements, feel free to open a pull request or issue. You can also fork this repository to create and manage your own custom configurations. This setup is tailored to my preferences, but I welcome feedback and ideas!

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

Happy coding! 🚀
