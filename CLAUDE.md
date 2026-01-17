# CLAUDE.md - AI Assistant Guide for dotfiles Repository

**Repository**: Personal dotfiles configuration
**Maintainer**: Wendell Medina
**Purpose**: Version-controlled Unix/Linux configuration files for bash, vim, tmux, and git
**Last Updated**: 2026-01-17

---

## Table of Contents

1. [Repository Overview](#repository-overview)
2. [Directory Structure](#directory-structure)
3. [File Descriptions](#file-descriptions)
4. [Development Workflows](#development-workflows)
5. [Key Conventions](#key-conventions)
6. [Working with This Repository](#working-with-this-repository)
7. [Common Tasks](#common-tasks)
8. [Important Notes](#important-notes)

---

## Repository Overview

This is a personal dotfiles repository containing configuration files for a Linux/Unix development environment. The repository manages shell configurations (bash), terminal multiplexer settings (tmux), text editor setup (vim), and git configuration.

### Technology Stack
- **Shell**: Bash
- **Editor**: Vim with Python IDE capabilities
- **Terminal Multiplexer**: tmux
- **Version Control**: Git
- **Primary Use Case**: Python development environment

---

## Directory Structure

```
/home/user/dotfiles/
├── .bashrc                    # Bash shell configuration
├── .bash_profile              # Bash login shell configuration
├── .profile                   # POSIX shell profile
├── .vimrc                     # Vim editor configuration (183 lines)
├── .tmux.conf                 # tmux terminal multiplexer config
├── .gitconfig                 # Git user configuration
├── .gitignore                 # Files to ignore in git
├── .vim/                      # Vim runtime directory
│   ├── autoload/              # Vim plugin managers
│   │   ├── pathogen.vim       # Legacy plugin manager
│   │   └── plug.vim           # vim-plug plugin manager (current)
│   ├── bundle/                # Pathogen-managed plugins (legacy)
│   │   ├── ctrlp.vim/
│   │   ├── jedi-vim/
│   │   ├── nerdtree/
│   │   └── vim-powerline/
│   ├── plugged/               # vim-plug managed plugins (current)
│   │   ├── ansible-vim/
│   │   ├── jedi-vim/
│   │   ├── nerdtree/
│   │   ├── vim-airline/
│   │   └── vim-airline-themes/
│   ├── colors/                # Vim color schemes
│   │   └── wombat256mod.vim
│   ├── ftplugin/              # Filetype-specific plugins
│   │   └── python_editing.vim
│   └── .netrwhist            # Vim netrw history (ignored file)
└── README.md                  # Repository README
```

---

## File Descriptions

### Shell Configuration Files

#### `.bashrc` (2478 bytes)
Primary bash shell configuration file loaded for interactive non-login shells.

**Key Features**:
- History management (1000 commands, no duplicates)
- Colored prompt with user@host:directory format
- Color support for ls, grep, fgrep, egrep
- Window size checking after each command
- Only executes for interactive shells (checks `$PS1`)

**Prompt Format**: `\u@\h:\w\$` (user@host:current_directory$)
**Color**: Red username/hostname, blue directory

#### `.bash_profile` (344 bytes)
Configuration loaded for login shells.

**Purpose**:
- Sources `.bashrc` for consistent configuration
- Sets up PATH environment variable
- Configures TERM to xterm-256color (unless in tmux)

**PATH**: `$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin`

#### `.profile` (258 bytes)
POSIX-compliant shell profile, fallback for non-bash shells.

**Purpose**:
- Sources `.bashrc` if running bash
- Sets PATH environment variable
- Configures terminal type
- Disables terminal messaging (`mesg n`)

### Vim Configuration

#### `.vimrc` (5108 bytes, 183 lines)
Comprehensive Vim configuration focused on Python development.

**Key Settings**:
- **Leader Key**: `,` (comma)
- **Plugin Manager**: vim-plug (modern, current)
- **Color Scheme**: wombat256mod (256-color)
- **Line Numbers**: Relative numbering enabled
- **Indentation**: 4 spaces (no tabs)
- **Paste Toggle**: F2 key
- **Color Column**: 80 characters

**Important Keybindings**:
- `<Leader>nn` - Toggle NERDTree
- `<Leader>n` - Previous tab
- `<Leader>m` - Next tab
- `<Leader>b` - Insert Python debugger breakpoint
- `<C-n>` - Clear search highlighting
- `<C-j/k/l/h>` - Navigate between splits
- `<Leader>s` - Sort selected lines

**Installed Plugins** (via vim-plug):
1. `pearofducks/ansible-vim` - Ansible syntax support
2. `scrooloose/nerdtree` - File tree explorer
3. `vim-airline/vim-airline` - Status line
4. `vim-airline-themes/vim-airline-themes` - Airline themes
5. `davidhalter/jedi-vim` - Python autocompletion and navigation

**Python IDE Features**:
- Jedi autocompletion (popup disabled on dot)
- IPython debugger breakpoint shortcut
- Python-specific editing configurations
- Code folding support
- Omnicomplete navigation with Ctrl+j/k

**File Behavior**:
- Auto-reloads `.vimrc` on save
- Shows trailing whitespace in red
- No line wrapping
- Cursor line highlighting
- 700 levels of undo history

#### Plugin Management Evolution
The repository shows a transition from **Pathogen** to **vim-plug**:
- **Legacy**: `.vim/autoload/pathogen.vim` + `.vim/bundle/` (commented out in .vimrc:106)
- **Current**: `.vim/autoload/plug.vim` + `.vim/plugged/` (active in .vimrc:111-182)

### tmux Configuration

#### `.tmux.conf` (1907 bytes)
Terminal multiplexer configuration for efficient terminal management.

**Key Settings**:
- **Prefix Key**: `Ctrl+q` (instead of default Ctrl+b)
- **Base Index**: 1 (windows and panes)
- **Mode Keys**: vi
- **Color Mode**: 256-color terminal
- **Mouse**: Disabled (keyboard-only workflow)

**Important Keybindings**:
- `Prefix + r` - Reload configuration
- `Prefix + \` - Split horizontally
- `Prefix + -` - Split vertically
- `Prefix + h/j/k/l` - Select pane (vim-style)
- `Prefix + H/J/K/L` - Resize pane
- `Prefix + Ctrl+h/l` - Previous/next window

**Visual Settings**:
- Status bar: Cyan text on teal background (colour23)
- Active window: White on dark green (colour22)
- Pane borders: Yellow/red highlighting
- Status left: `[session_name]`
- Status right: `hostname date time`
- Status updates: Every 60 seconds

### Git Configuration

#### `.gitconfig` (127 bytes)
Git user identity configuration.

**User Details**:
- Name: Wendell Medina
- Email: wendellmedina@gmail.com

**Note**: This file contains personal information and should be kept private or excluded when sharing the repository publicly.

#### `.gitignore` (11 bytes)
Currently ignores: `.netrwhist` (Vim netrw browsing history)

---

## Development Workflows

### Git Workflow (Based on Commit History)

**Recent Commits**:
```
0ce1141 - Changed plugin manager
1038410 - Added .netrwhist
12f6bd5 - Added path
38dd98f - add vim plugins for python IDE support
1529569 - add vim plugins for python IDE support
8d7c76a - enabled python IDE support
```

**Commit Message Conventions**:
- Use lowercase for commit messages
- Keep messages concise and descriptive
- Focus on what changed, not why
- Examples: "Added X", "Changed Y", "enabled Z"

**Branch Strategy**:
- Uses feature branches with naming pattern: `claude/<description>-<ID>`
- Current branch: `claude/add-claude-documentation-X2EvA`
- Development happens on feature branches before merging

### Vim Plugin Installation Workflow

**Using vim-plug (Current Method)**:

1. Add plugin to `.vimrc` between `call plug#begin()` and `call plug#end()`:
   ```vim
   Plug 'author/plugin-name'
   ```

2. Reload `.vimrc` (happens automatically on save due to autocmd)

3. Install plugins in Vim:
   ```vim
   :PlugInstall
   ```

4. Update plugins:
   ```vim
   :PlugUpdate
   ```

5. Remove unused plugins:
   ```vim
   :PlugClean
   ```

**Important**: The repository has transitioned from Pathogen to vim-plug. The Pathogen setup is commented out but `.vim/bundle/` still contains old plugins for backward compatibility.

### Making Changes to Dotfiles

**Standard Workflow**:

1. Edit configuration file directly in the repository
2. Test changes:
   - **Bash**: `source ~/.bashrc` or start new shell
   - **Vim**: Auto-reloads on save or `:source ~/.vimrc`
   - **tmux**: `Prefix + r` or `tmux source ~/.tmux.conf`
3. Commit changes with descriptive message
4. Push to remote repository

---

## Key Conventions

### Code Style and Formatting

#### All Configuration Files
- **Maintainer Header**: Every file includes:
  ```
  #   Filename: <filename>
  # Maintainer: Wendell Medina
  #
  ```
- **Consistent Formatting**: Clear section separators and comments
- **Documentation**: Inline comments explain non-obvious configurations

#### Vim Configuration
- **Indentation**: 4 spaces (enforced via `set expandtab`)
- **Line Length**: 80 characters (visual guide at column 80)
- **Comments**: Use Vim comment style (`" comment`)
- **Sections**: Clearly delineated (see "Python IDE Setup" section)

#### Shell Scripts
- **Comments**: Use `#` for bash comments
- **Indentation**: Consistent 4-space or tab indentation
- **Conditionals**: Clear bracket spacing in conditions

### File Organization Principles

1. **Configuration Files at Root**: All dotfiles in repository root
2. **Vim Runtime in .vim/**: All Vim-specific files under `.vim/`
3. **Plugin Separation**:
   - `autoload/` for plugin managers
   - `bundle/` for legacy plugins
   - `plugged/` for current plugins
   - `colors/` for color schemes
   - `ftplugin/` for filetype plugins

### Naming Conventions

- **Dotfiles**: Leading dot (`.bashrc`, `.vimrc`, etc.)
- **Vim Plugins**: Follow upstream naming exactly
- **Git Branches**: `claude/<description>-<session-id>`
- **Commit Messages**: Lowercase, imperative mood, concise

---

## Working with This Repository

### Setup on New System

**Prerequisites**:
- Git installed
- Bash shell
- Vim 8.0+ (for vim-plug support)
- tmux (optional but recommended)
- curl (for downloading vim-plug)

**Installation Steps**:

1. **Clone Repository**:
   ```bash
   git clone <repository-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. **Create Symlinks** (recommended approach):
   ```bash
   ln -sf ~/dotfiles/.bashrc ~/.bashrc
   ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
   ln -sf ~/dotfiles/.profile ~/.profile
   ln -sf ~/dotfiles/.vimrc ~/.vimrc
   ln -sf ~/dotfiles/.vim ~/.vim
   ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
   ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
   ```

3. **Install vim-plug** (if not already present):
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

4. **Install Vim Plugins**:
   ```bash
   vim +PlugInstall +qall
   ```

5. **Reload Shell**:
   ```bash
   source ~/.bashrc
   ```

6. **Start tmux**:
   ```bash
   tmux
   ```

### Updating Configuration

**Local Changes**:
```bash
cd ~/dotfiles
# Make edits to configuration files
git add <changed-files>
git commit -m "descriptive message"
git push origin <branch-name>
```

**Pulling Updates**:
```bash
cd ~/dotfiles
git pull origin <branch-name>
# Reload configurations as needed
source ~/.bashrc
```

### Testing Changes Safely

1. **Create Test Branch**:
   ```bash
   git checkout -b test-changes
   ```

2. **Make and Test Changes**:
   - Edit files
   - Test in current shell/editor session
   - Verify no errors

3. **Commit or Revert**:
   ```bash
   # If good:
   git add .
   git commit -m "tested changes"
   git checkout main
   git merge test-changes

   # If bad:
   git checkout main
   git branch -D test-changes
   ```

---

## Common Tasks

### Adding a New Vim Plugin

```bash
# 1. Edit .vimrc
vim ~/dotfiles/.vimrc

# 2. Add between plug#begin() and plug#end():
#    Plug 'author/plugin-name'

# 3. Save and install
vim +PlugInstall +qall

# 4. Commit change
cd ~/dotfiles
git add .vimrc
git commit -m "add plugin-name vim plugin"
git push origin <branch-name>
```

### Changing Vim Color Scheme

```bash
# 1. Download color scheme to ~/.vim/colors/
cd ~/.vim/colors
wget -O newscheme.vim <url>

# 2. Edit .vimrc
vim ~/dotfiles/.vimrc
# Change line 57: color wombat256mod -> color newscheme

# 3. Test
vim  # Verify colors look good

# 4. Commit
cd ~/dotfiles
git add .vimrc .vim/colors/newscheme.vim
git commit -m "change vim color scheme to newscheme"
```

### Modifying tmux Prefix Key

```bash
# 1. Edit .tmux.conf
vim ~/dotfiles/.tmux.conf
# Change line 6: set -g prefix C-q -> set -g prefix C-<new-key>

# 2. Reload tmux config
# In tmux session, press current prefix + r
# OR: tmux source ~/.tmux.conf

# 3. Commit
cd ~/dotfiles
git add .tmux.conf
git commit -m "change tmux prefix to Ctrl+<new-key>"
```

### Adding Bash Aliases

```bash
# 1. Edit .bashrc
vim ~/dotfiles/.bashrc

# 2. Add alias at end of file (before fi on line 76):
#    alias myalias='command'

# 3. Reload
source ~/.bashrc

# 4. Test
myalias

# 5. Commit
cd ~/dotfiles
git add .bashrc
git commit -m "add myalias bash alias"
```

### Customizing Bash Prompt

The prompt is defined in `.bashrc` at lines 52-56. Current format:
```bash
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```

Components:
- `\u` - username
- `\h` - hostname
- `\w` - current working directory
- `\[\033[01;31m\]` - color code (red)
- `\[\033[01;34m\]` - color code (blue)

---

## Important Notes

### For AI Assistants

**When Modifying This Repository**:

1. **Always Read Before Editing**: Never propose changes to files you haven't read
2. **Respect Existing Conventions**: Follow the maintainer's style and patterns
3. **Test Locally First**: Suggest testing before committing
4. **Minimal Changes**: Only modify what's necessary, don't over-engineer
5. **Preserve Personal Info**: Be aware of `.gitconfig` containing personal details
6. **Comment Thoroughly**: Add comments explaining non-obvious changes
7. **Backup Critical Files**: Suggest backups before major changes

**Plugin Management**:
- Only use vim-plug (`Plug` directive), not Pathogen
- Don't modify files in `.vim/bundle/` (legacy)
- New plugins go in `.vimrc` between lines 111-182

**Compatibility Concerns**:
- tmux config uses older syntax (e.g., `mode-mouse`, deprecated in newer versions)
- Some settings may need updating for modern tmux/vim versions
- Always verify compatibility before suggesting changes

**Security Considerations**:
- `.gitconfig` contains email address (personal information)
- No sensitive credentials should be stored in dotfiles
- Consider `.gitignore` for machine-specific configurations

**Version Control**:
- Branch naming follows pattern: `claude/<description>-<ID>`
- Commits should be lowercase, concise messages
- Push to feature branches, not main/master directly

### Troubleshooting

**Vim Plugins Not Loading**:
```bash
# Reinstall plugins
vim +PlugClean +PlugInstall +qall

# Check for errors
vim +PlugStatus
```

**tmux Colors Not Working**:
```bash
# Check TERM variable
echo $TERM  # Should be xterm-256color or screen-256color

# Set in .bash_profile if needed (already configured)
export TERM=xterm-256color
```

**Bash Configuration Not Loading**:
```bash
# Check which file is sourced on login
echo $BASH_SOURCE

# Manually source
source ~/.bashrc
source ~/.bash_profile
```

**Git Push Fails**:
```bash
# Ensure correct branch naming (must start with claude/ and match session ID)
git branch --show-current

# Use correct push command
git push -u origin claude/<description>-<ID>
```

---

## Quick Reference

### File Locations
- **Bash Config**: `~/.bashrc`, `~/.bash_profile`, `~/.profile`
- **Vim Config**: `~/.vimrc`, `~/.vim/`
- **tmux Config**: `~/.tmux.conf`
- **Git Config**: `~/.gitconfig`

### Key Commands
- **Reload Bash**: `source ~/.bashrc`
- **Reload Vim**: `:source ~/.vimrc` (or automatic on save)
- **Reload tmux**: `Prefix + r` or `tmux source ~/.tmux.conf`
- **Install Vim Plugins**: `:PlugInstall`
- **Update Vim Plugins**: `:PlugUpdate`

### Important Keybindings
- **Vim Leader**: `,`
- **tmux Prefix**: `Ctrl+q`
- **Vim Paste Mode**: `F2`
- **Clear Search**: `Ctrl+n`
- **NERDTree Toggle**: `,nn`
- **Python Breakpoint**: `,b`

---

**Document Version**: 1.0
**Created**: 2026-01-17
**Purpose**: Guide AI assistants working with this dotfiles repository
**Maintenance**: Update when significant changes are made to repository structure or workflows
