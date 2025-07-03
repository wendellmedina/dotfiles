# Dotfiles Documentation

## Table of Contents
- [Overview](#overview)
- [Installation](#installation)
- [Configuration Files](#configuration-files)
  - [Tmux Configuration (.tmux.conf)](#tmux-configuration-tmuxconf)
  - [Vim Configuration (.vimrc)](#vim-configuration-vimrc)
  - [Bash Configuration (.bashrc)](#bash-configuration-bashrc)
  - [Git Configuration (.gitconfig)](#git-configuration-gitconfig)
  - [Shell Profiles (.bash_profile, .profile)](#shell-profiles-bash_profile-profile)
- [Quick Reference](#quick-reference)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)

## Overview

This repository contains a collection of dotfiles for setting up a productive development environment. The configuration files are optimized for:

- **Terminal Multiplexing**: Enhanced tmux setup with custom keybindings
- **Text Editing**: Comprehensive vim configuration with plugins and IDE features
- **Shell Environment**: Bash configuration with history management and colored output
- **Version Control**: Git configuration with user settings
- **Cross-platform Compatibility**: Works on Linux, macOS, and WSL

**Maintainer**: Wendell Medina (wendellmedina@gmail.com)

## Installation

### Quick Setup
```bash
# Clone the repository
git clone <repository-url> ~/dotfiles
cd ~/dotfiles

# Backup existing dotfiles
mkdir -p ~/.dotfiles-backup
cp ~/.tmux.conf ~/.dotfiles-backup/ 2>/dev/null || true
cp ~/.vimrc ~/.dotfiles-backup/ 2>/dev/null || true
cp ~/.bashrc ~/.dotfiles-backup/ 2>/dev/null || true
cp ~/.gitconfig ~/.dotfiles-backup/ 2>/dev/null || true
cp ~/.bash_profile ~/.dotfiles-backup/ 2>/dev/null || true
cp ~/.profile ~/.dotfiles-backup/ 2>/dev/null || true

# Create symbolic links
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.profile ~/.profile

# Reload configurations
source ~/.bashrc
tmux source-file ~/.tmux.conf 2>/dev/null || true
```

### Vim Plugin Setup
```bash
# Install vim-plug plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install color scheme
mkdir -p ~/.vim/colors
wget -O ~/.vim/colors/wombat256mod.vim \
    http://www.vim.org/scripts/download_script.php?src_id=13400

# Install plugins
vim +PlugInstall +qall
```

## Configuration Files

### Tmux Configuration (.tmux.conf)

#### Overview
Enhanced tmux configuration with custom keybindings, visual improvements, and productivity features.

#### Key Features

**Prefix Key**: `Ctrl+q` (instead of default `Ctrl+b`)

#### Key Bindings

| Binding | Action | Description |
|---------|--------|-------------|
| `Ctrl+q r` | Reload config | Reloads tmux configuration |
| `Ctrl+q \` | Split horizontal | Creates horizontal pane |
| `Ctrl+q -` | Split vertical | Creates vertical pane |
| `Ctrl+q h/j/k/l` | Navigate panes | Vim-like pane navigation |
| `Ctrl+q H/J/K/L` | Resize panes | Resize panes (repeatable) |
| `Ctrl+q Ctrl+h/l` | Switch windows | Navigate between windows |

#### Visual Settings

**Colors**:
- Status bar: White text on dark cyan background (`colour23`)
- Active window: White text on dark green background (`colour22`)
- Inactive windows: Cyan text with dim attribute
- Active pane border: Bright red (`colour9`) on yellow (`colour11`)
- Regular pane border: Yellow (`colour3`) on black

**Status Bar**:
- Left: Session name in yellow brackets `[session-name]`
- Right: Hostname, date, and time `hostname dd mmm HH:MM`
- Center: Window list
- Update interval: 60 seconds

#### Settings

```bash
# Essential settings
set -g prefix C-q              # Custom prefix key
set -g base-index 1            # Start window numbering at 1
setw -g pane-base-index 1      # Start pane numbering at 1
set -g default-terminal "screen-256color"  # 256 color support
setw -g mode-keys vi           # Vi-style key bindings
setw -g monitor-activity on    # Monitor window activity
set -g visual-activity on      # Visual activity alerts
```

#### Usage Examples

```bash
# Start new tmux session
tmux new-session -s development

# Create horizontal split
Ctrl+q \

# Create vertical split
Ctrl+q -

# Navigate between panes
Ctrl+q h  # Move left
Ctrl+q j  # Move down
Ctrl+q k  # Move up
Ctrl+q l  # Move right

# Resize panes
Ctrl+q H  # Resize left (repeatable)
Ctrl+q J  # Resize down (repeatable)
Ctrl+q K  # Resize up (repeatable)
Ctrl+q L  # Resize right (repeatable)

# Switch between windows
Ctrl+q Ctrl+h  # Previous window
Ctrl+q Ctrl+l  # Next window

# Reload configuration
Ctrl+q r
```

### Vim Configuration (.vimrc)

#### Overview
Comprehensive vim configuration with IDE features, plugins, and Python development support.

#### Key Features
- **Plugin Management**: Uses vim-plug
- **Python IDE**: Jedi autocomplete, NERDTree file explorer
- **Visual Enhancements**: Custom color scheme, airline status bar
- **Productivity**: Custom keybindings, code formatting

#### Key Bindings

**Leader Key**: `,` (comma)

| Binding | Mode | Action | Description |
|---------|------|--------|-------------|
| `F2` | Any | Paste toggle | Toggle paste mode |
| `Ctrl+n` | Any | Clear highlight | Remove search highlighting |
| `Ctrl+h/j/k/l` | Normal | Window navigation | Move between vim windows |
| `,n` | Normal | Previous tab | Navigate to previous tab |
| `,m` | Normal | Next tab | Navigate to next tab |
| `,s` | Visual | Sort lines | Sort selected lines |
| `</>` | Visual | Indent/outdent | Better indentation (stays in visual mode) |
| `,nn` | Normal | Toggle NERDTree | Show/hide file explorer |
| `,nf` | Normal | Find in NERDTree | Locate current file in tree |
| `,z` | Normal | Show usages | Show symbol usages (jedi) |
| `,b` | Normal | Set breakpoint | Insert Python debugger breakpoint |

#### Plugins

**File Management**:
- **NERDTree**: File explorer with tree view
  ```vim
  ,nn          " Toggle NERDTree
  ,nf          " Find current file in NERDTree
  ```

**Status Line**:
- **vim-airline**: Enhanced status line with themes
  ```vim
  " Theme: dark
  " Shows: mode, file path, line/column, file type
  ```

**Python Development**:
- **jedi-vim**: Python autocompletion and navigation
  ```vim
  ,z           " Show usages of symbol under cursor
  ,b           " Insert ipdb breakpoint
  Ctrl+j/k     " Navigate autocomplete menu
  ```

**Ansible Support**:
- **ansible-vim**: Syntax highlighting for Ansible playbooks

#### Settings

**Display**:
```vim
set relativenumber      " Show relative line numbers
set cursorline         " Highlight current line
set colorcolumn=80     " Show column at 80 characters
set nowrap             " Don't wrap long lines
```

**Indentation**:
```vim
set tabstop=4          " Tab width
set softtabstop=4      " Soft tab width
set shiftwidth=4       " Indent width
set expandtab          " Use spaces instead of tabs
```

**Editing**:
```vim
set mouse=a            " Enable mouse support
set clipboard=unnamed  " Use system clipboard
set history=700        " Command history size
set undolevels=700     " Undo history size
```

#### Usage Examples

**Basic Editing**:
```vim
" Open file explorer
,nn

" Navigate between tabs
,n  " Previous tab
,m  " Next tab

" Clear search highlighting
Ctrl+n

" Toggle paste mode (for large code blocks)
F2
```

**Python Development**:
```vim
" Set debugger breakpoint
,b
" This inserts: import ipdb; ipdb.set_trace() # BREAKPOINT

" Find symbol usages
,z

" Auto-completion (appears automatically when typing)
Ctrl+j  " Move down in completion menu
Ctrl+k  " Move up in completion menu
```

**Code Formatting**:
```vim
" Select code block in visual mode, then:
>  " Indent right
<  " Indent left
,s " Sort selected lines
```

### Bash Configuration (.bashrc)

#### Overview
Enhanced bash configuration with history management, colored output, and improved prompt.

#### Key Features

**History Management**:
```bash
HISTCONTROL=ignoredups:ignorespace  # Ignore duplicates and commands starting with space
HISTSIZE=1000                       # In-memory history size
HISTFILESIZE=2000                   # History file size
shopt -s histappend                 # Append to history file, don't overwrite
```

**Window Management**:
```bash
shopt -s checkwinsize  # Update LINES and COLUMNS after each command
```

**Prompt Customization**:
- **Colored Prompt**: Red username@hostname, blue directory path
- **Terminal Title**: Shows user@host:directory in terminal title bar
- **Format**: `user@hostname:/current/directory$ `

**Color Aliases**:
```bash
alias ls='ls --color=auto'        # Colored directory listing
alias grep='grep --color=auto'    # Colored grep output
alias fgrep='fgrep --color=auto'  # Colored fgrep output
alias egrep='egrep --color=auto'  # Colored egrep output
```

#### Usage Examples

**Enhanced Directory Listing**:
```bash
ls        # Shows colored output automatically
ls -la    # Detailed listing with colors
```

**Colored Search**:
```bash
grep "pattern" file.txt     # Search with colored matches
egrep "regex" *.py         # Extended regex with colored matches
```

**History Features**:
```bash
history              # Show command history
!123                # Execute command number 123 from history
!!                  # Execute last command
!grep               # Execute last command starting with "grep"
```

### Git Configuration (.gitconfig)

#### Overview
Basic git configuration with user information.

#### Settings

**User Information**:
```ini
[user]
    name = Wendell Medina
    email = wendellmedina@gmail.com
```

#### Usage Examples

**Verify Configuration**:
```bash
git config --global user.name     # Should show: Wendell Medina
git config --global user.email    # Should show: wendellmedina@gmail.com
```

**Add Additional Settings**:
```bash
# Add more global settings
git config --global core.editor vim
git config --global init.defaultBranch main
git config --global pull.rebase false
```

### Shell Profiles (.bash_profile, .profile)

#### Overview
Shell initialization files that set up the environment and load bash configuration.

#### .bash_profile Features

**Path Configuration**:
```bash
PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin
```

**Terminal Setup**:
```bash
[ -z "$TMUX" ] && export TERM=xterm-256color  # Set 256-color support outside tmux
```

**Bashrc Integration**:
```bash
if [ -f ~/.bashrc ]; then
    . ~/.bashrc        # Load .bashrc if it exists
fi
```

#### .profile Features

**Cross-shell Compatibility**:
```bash
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc        # Load .bashrc only in bash
  fi
fi
```

**Message Handling**:
```bash
mesg n                 # Disable write messages from other users
```

#### Usage Examples

**Environment Verification**:
```bash
echo $PATH            # Verify PATH includes custom directories
echo $TERM            # Should show xterm-256color
```

## Quick Reference

### Tmux Cheat Sheet
```
Ctrl+q r     → Reload config
Ctrl+q \     → Horizontal split
Ctrl+q -     → Vertical split
Ctrl+q h/j/k/l → Navigate panes
Ctrl+q H/J/K/L → Resize panes
```

### Vim Cheat Sheet
```
,nn          → Toggle file explorer
,b           → Insert Python breakpoint
,z           → Show symbol usages
F2           → Toggle paste mode
Ctrl+n       → Clear search highlight
```

### Bash Aliases
```
ls           → Colored directory listing
grep         → Colored pattern matching
```

## Customization

### Adding Custom Tmux Bindings
```bash
# Add to .tmux.conf
bind-key <key> <command>

# Example: Add binding for new window
bind c new-window -c "#{pane_current_path}"
```

### Adding Vim Plugins
```vim
" Add to .vimrc between call plug#begin() and call plug#end()
Plug 'plugin/repository'

" Then run in vim:
:PlugInstall
```

### Adding Bash Aliases
```bash
# Add to .bashrc
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
```

### Customizing Git Configuration
```bash
# Add more git settings
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
```

## Troubleshooting

### Common Issues

**Tmux Colors Not Working**:
```bash
# Check terminal color support
echo $TERM

# Should be xterm-256color or screen-256color
# If not, add to .bashrc:
export TERM=xterm-256color
```

**Vim Plugins Not Loading**:
```bash
# Install vim-plug if missing
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Run plugin install
vim +PlugInstall +qall
```

**Vim Color Scheme Missing**:
```bash
# Download wombat256mod color scheme
mkdir -p ~/.vim/colors
wget -O ~/.vim/colors/wombat256mod.vim \
    http://www.vim.org/scripts/download_script.php?src_id=13400
```

**Bash Configuration Not Loading**:
```bash
# Manually reload
source ~/.bashrc

# Check if .bashrc is being called from .bash_profile
cat ~/.bash_profile | grep bashrc
```

### Performance Issues

**Vim Startup Slow**:
- Disable unused plugins
- Use `:PlugClean` to remove unused plugins
- Check `:PlugStatus` for plugin issues

**Tmux Session Management**:
```bash
# List active sessions
tmux list-sessions

# Attach to existing session
tmux attach-session -t session-name

# Kill specific session
tmux kill-session -t session-name
```

### Backup and Recovery

**Create Backup**:
```bash
# Backup current dotfiles
mkdir ~/.dotfiles-backup-$(date +%Y%m%d)
cp ~/.tmux.conf ~/.vimrc ~/.bashrc ~/.gitconfig ~/.dotfiles-backup-$(date +%Y%m%d)/
```

**Restore from Backup**:
```bash
# Restore from backup
cp ~/.dotfiles-backup-20231201/* ~/
source ~/.bashrc
```

---

**Last Updated**: $(date)
**Version**: 1.0
**Maintainer**: Wendell Medina (wendellmedina@gmail.com)