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
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Live grep in the snacks picker |
| [fd](https://github.com/sharkdp/fd) | File finding in the snacks picker |

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

Leader key: `Space`. See **[keybindings.md](keybindings.md)** for the full list: custom keymaps, plugin defaults and useful Neovim built-ins.

## Troubleshooting

### Check Health

```vim
:checkhealth
```

For specific checks:

```vim
:checkhealth vim.lsp
:checkhealth nvim-tree
:checkhealth snacks
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

### Picker Slow

Ensure `ripgrep` and `fd` are installed:

```bash
which rg fd
```

## File Structure

```
~/.config/nvim/
├── init.lua              # Main configuration
├── keybindings.md        # All keybindings
├── nvim-pack-lock.json   # Plugin lockfile (auto-generated)
├── colors/               # Custom colorschemes
└── plugin/               # Custom plugin scripts
```
