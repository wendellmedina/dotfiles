# Dotfiles Configuration Repository

A collection of carefully crafted configuration files for a productive development environment.

## Quick Start

```bash
# Clone and install
git clone <repository-url> ~/dotfiles
cd ~/dotfiles

# Backup existing configs
mkdir -p ~/.dotfiles-backup
cp ~/.{tmux.conf,vimrc,bashrc,gitconfig,bash_profile,profile} ~/.dotfiles-backup/ 2>/dev/null || true

# Install configurations
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.profile ~/.profile

# Reload
source ~/.bashrc
```

## What's Included

- **`.tmux.conf`** - Enhanced tmux with custom keybindings (Ctrl+q prefix)
- **`.vimrc`** - Comprehensive vim setup with plugins and Python IDE features
- **`.bashrc`** - Improved bash with history management and colored output
- **`.gitconfig`** - Git configuration with user settings
- **`.bash_profile` / `.profile`** - Shell initialization and environment setup

## Key Features

### Tmux
- Custom prefix key (`Ctrl+q`)
- Vim-like pane navigation
- Visual improvements and 256-color support

### Vim
- Plugin management with vim-plug
- Python development tools (jedi, NERDTree)
- Custom keybindings with comma leader key
- Enhanced status line and color scheme

### Bash
- Improved history management
- Colored prompt and command output
- Terminal title updates

## Quick Reference

### Tmux
```
Ctrl+q \     → Split horizontal
Ctrl+q -     → Split vertical  
Ctrl+q h/j/k/l → Navigate panes
Ctrl+q r     → Reload config
```

### Vim
```
,nn          → Toggle file explorer
,b           → Insert Python breakpoint
F2           → Toggle paste mode
Ctrl+n       → Clear search highlight
```

## Documentation

📖 **[View Complete Documentation](DOCUMENTATION.md)** - Comprehensive guide with detailed explanations, examples, and troubleshooting.

## Maintainer

**Wendell Medina** (wendellmedina@gmail.com)

---

*For detailed installation instructions, usage examples, customization options, and troubleshooting, see [DOCUMENTATION.md](DOCUMENTATION.md).*
