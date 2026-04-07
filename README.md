# Neovim Configuration

My Neovim 0.12+ configuration using the built-in `vim.pack` plugin manager.

## Requirements

- **Neovim 0.12.0** or later
- **Git** (for plugin management)

## Installation

```bash
# Clone the repository
git clone https://github.com/yedhukrishnan/neovim-config.git ~/.config/nvim

# Start Neovim - plugins will be installed automatically
nvim
```

On first launch, `vim.pack` will prompt you to confirm plugin installation.

## Dependencies

### Required

These tools are required for core functionality:

```bash
# macOS (Homebrew)
brew install ripgrep fd

# Ubuntu/Debian
sudo apt install ripgrep fd-find

# Arch Linux
sudo pacman -S ripgrep fd
```

| Tool | Purpose |
|------|---------|
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Fast grep for Telescope live_grep |
| [fd](https://github.com/sharkdp/fd) | Fast find for Telescope find_files |

### Language Servers

Install the language servers for languages you use:

#### Ruby

```bash
gem install solargraph
```

If using RVM, the config expects solargraph at `~/.rvm/wrappers/default/solargraph`.

#### JavaScript / TypeScript

```bash
npm install -g typescript typescript-language-server
```

#### Python

```bash
pip install pyright
```

Or using pipx (recommended):

```bash
pipx install pyright
```

#### C / C++

```bash
# macOS
brew install llvm

# Ubuntu/Debian
sudo apt install clangd

# Arch Linux
sudo pacman -S clang
```

#### Go

```bash
go install golang.org/x/tools/gopls@latest
```

Make sure `$GOPATH/bin` is in your `PATH`.

#### Elixir

Download the latest release from [elixir-ls](https://github.com/elixir-lsp/elixir-ls/releases) and add to your `PATH`:

```bash
# Example: extract to ~/.local/share/elixir-ls
unzip elixir-ls-*.zip -d ~/.local/share/elixir-ls
chmod +x ~/.local/share/elixir-ls/language_server.sh

# Add to PATH (add to your .bashrc/.zshrc)
export PATH="$HOME/.local/share/elixir-ls:$PATH"

# Create symlink for easier access
ln -s ~/.local/share/elixir-ls/language_server.sh ~/.local/bin/elixir-ls
```

### Formatters (Optional)

For code formatting via `conform.nvim`:

```bash
# Lua
brew install stylua

# Python
pip install isort black

# JavaScript/TypeScript
npm install -g prettierd prettier

# Rust
rustup component add rustfmt

# Ruby (usually comes with Rails projects)
gem install rubocop
```

### Other Tools (Optional)

```bash
# Silver Searcher (for ack.vim)
brew install the_silver_searcher

# LaTeX (for vimtex)
brew install --cask mactex
```

## Plugin Management

This config uses Neovim 0.12's built-in `vim.pack` plugin manager.

### Update Plugins

```vim
:lua vim.pack.update()
```

Review changes in the confirmation buffer, then:
- `:w` to confirm updates
- `:q` to cancel

### Check Plugin Status

```vim
:lua vim.print(vim.pack.get())
```

### Lockfile

Plugin versions are tracked in `nvim-pack-lock.json`. Commit this file to ensure consistent installs across machines.

## Key Bindings

Leader key: `Space`

### General

| Keymap | Action |
|--------|--------|
| `jk` | Exit insert mode |
| `<C-h/j/k/l>` | Window navigation |
| `<C-s>` | Clear search highlights |
| `[b` / `]b` | Next/Previous buffer |
| `<leader>r` | Toggle relative line numbers |

### Telescope (Find)

| Keymap | Action |
|--------|--------|
| `<leader>p` | Find files |
| `<leader>fg` | Live grep |
| `<leader>b` | Buffers |
| `<leader>fh` | Help tags |

### File Tree (nvim-tree)

| Keymap | Action |
|--------|--------|
| `<leader>nf` | Find current file in tree |

### LSP

| Keymap | Action |
|--------|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `gr` | Find references |
| `gy` | Go to type definition |
| `K` | Hover documentation |
| `<C-k>` (insert) | Signature help |
| `<leader>lr` | Rename symbol |
| `<leader>la` | Code action |
| `<leader>lf` | Format buffer |
| `<leader>ld` | Line diagnostics |
| `[d` / `]d` | Previous/Next diagnostic |

### AI Assistants

#### Claude Code

| Keymap | Action |
|--------|--------|
| `<leader>ac` | Toggle Claude |
| `<leader>af` | Focus Claude |
| `<leader>ar` | Resume Claude |
| `<leader>aa` | Accept diff |
| `<leader>ad` | Deny diff |

#### OpenCode

| Keymap | Action |
|--------|--------|
| `<leader>oa` | Ask OpenCode |
| `<leader>os` | Select action |
| `<leader>ot` | Toggle OpenCode |
| `<leader>oo` | Add range |
| `<leader>ol` | Add line |

## Troubleshooting

### Check Health

```vim
:checkhealth
```

For specific checks:

```vim
:checkhealth vim.lsp
:checkhealth nvim-tree
:checkhealth telescope
```

### LSP Not Working

1. Check if the language server is installed and in PATH:
   ```bash
   which solargraph  # Ruby
   which typescript-language-server  # JS/TS
   which pyright-langserver  # Python
   which clangd  # C/C++
   which gopls  # Go
   which elixir-ls  # Elixir
   ```

2. Check LSP status in Neovim:
   ```vim
   :lsp        " Interactive LSP management (0.12+)
   :LspInfo    " Show attached clients
   ```

### Plugins Not Loading

1. Ensure plugins are installed:
   ```vim
   :lua vim.print(vim.pack.get())
   ```

2. Reinstall a specific plugin:
   ```vim
   :lua vim.pack.del({ 'plugin-name' })
   " Restart Neovim to reinstall
   ```

### Telescope Slow

Ensure `ripgrep` and `fd` are installed:

```bash
which rg fd
```

## File Structure

```
~/.config/nvim/
├── init.lua              # Main configuration
├── nvim-pack-lock.json   # Plugin lockfile (auto-generated)
├── colors/               # Custom colorschemes
└── plugin/               # Custom plugin scripts
```
