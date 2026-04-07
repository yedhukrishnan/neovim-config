-- =============================================================================
-- Neovim 0.12.0 Configuration using vim.pack
-- =============================================================================

-- Leader key (set before plugins)
vim.g.mapleader = ' '

-- Disable netrw (required for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Enable ui2 (new experimental UI in Neovim 0.12)
-- Avoids "Press ENTER" interruptions, highlights cmdline as you type
require('vim._core.ui2').enable({})

-- =============================================================================
-- Options
-- =============================================================================
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.showcmd = true
-- Note: 'lazyredraw' is deprecated in 0.12, screen updates are optimized automatically
vim.opt.ignorecase = true  -- renamed from 'ic' for clarity
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.backspace = [[indent,eol,start]]
vim.opt.cursorline = true
vim.opt.history = 1000
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"  -- Use treesitter for folding (0.12 default)
vim.opt.foldlevel = 99

-- Neovim 0.12 features
vim.opt.pumborder = 'single'                          -- Border around completion popup (single/double/rounded/shadow)
vim.opt.autocomplete = true                           -- Built-in autocompletion

-- Load built-in opt plugins (Neovim 0.12)
vim.cmd.packadd('nvim.undotree')                      -- :Undotree - visual undo tree
vim.cmd.packadd('nvim.difftool')                      -- :DiffTool - compare files/directories

-- =============================================================================
-- Plugin Management with vim.pack (built-in in Neovim 0.12)
-- =============================================================================
-- Helper for GitHub URLs
local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add({
  -- Colorschemes
  { src = gh('ellisonleao/gruvbox.nvim'), name = 'gruvbox' },
  { src = gh('rebelot/kanagawa.nvim'), name = 'kanagawa' },
  { src = gh('catppuccin/nvim'), name = 'catppuccin' },
  { src = gh('navarasu/onedark.nvim'), name = 'onedark' },
  { src = gh('tiagovla/tokyodark.nvim'), name = 'tokyodark' },
  { src = gh('olimorris/onedarkpro.nvim'), name = 'onedarkpro' },
  { src = gh('EdenEast/nightfox.nvim'), name = 'nightfox' },

  -- Telescope (fuzzy finder)
  { src = gh('nvim-telescope/telescope.nvim'), name = 'telescope' },
  { src = gh('nvim-lua/plenary.nvim'), name = 'plenary' },

  -- File tree
  { src = gh('nvim-tree/nvim-tree.lua'), name = 'nvim-tree' },
  { src = gh('nvim-tree/nvim-web-devicons'), name = 'nvim-web-devicons' },

  -- Status line
  { src = gh('nvim-lualine/lualine.nvim'), name = 'lualine' },

  -- Git integration
  { src = gh('tpope/vim-fugitive'), name = 'vim-fugitive' },
  { src = gh('tpope/vim-rhubarb'), name = 'vim-rhubarb' },

  -- Editing enhancements
  { src = gh('windwp/nvim-autopairs'), name = 'nvim-autopairs' },
  { src = gh('echasnovski/mini.surround'), name = 'mini.surround' },
  -- Note: mini.indentscope is now redundant with built-in indent-blankline improvements
  -- but keeping if you prefer its visual style
  { src = gh('echasnovski/mini.indentscope'), name = 'mini.indentscope' },

  -- Treesitter (syntax highlighting, folding, text objects)
  { src = gh('nvim-treesitter/nvim-treesitter'), name = 'nvim-treesitter' },

  -- Formatting
  { src = gh('stevearc/conform.nvim'), name = 'conform' },

  -- Rails development
  { src = gh('tpope/vim-rails'), name = 'vim-rails' },

  -- LaTeX
  { src = gh('lervag/vimtex'), name = 'vimtex' },

  -- Search
  { src = gh('mileszs/ack.vim'), name = 'ack' },

  -- AI assistants
  { src = gh('github/copilot.vim'), name = 'copilot' },
  { src = gh('CopilotC-Nvim/CopilotChat.nvim'), name = 'CopilotChat' },

  -- Avante AI
  { src = gh('yetone/avante.nvim'), name = 'avante' },
  { src = gh('stevearc/dressing.nvim'), name = 'dressing' },
  { src = gh('MunifTanjim/nui.nvim'), name = 'nui' },
  { src = gh('HakonHarnes/img-clip.nvim'), name = 'img-clip' },
  { src = gh('MeanderingProgrammer/render-markdown.nvim'), name = 'render-markdown' },
  { src = gh('zbirenbaum/copilot.lua'), name = 'copilot-lua' },

  -- Habit training
  { src = gh('m4xshen/hardtime.nvim'), name = 'hardtime' },

  -- Claude/OpenCode integration
  { src = gh('coder/claudecode.nvim'), name = 'claudecode' },
  { src = gh('nickjvandyke/opencode.nvim'), name = 'opencode' },
  { src = gh('folke/snacks.nvim'), name = 'snacks' },

  -- Mini icons (dependency for several plugins)
  { src = gh('echasnovski/mini.icons'), name = 'mini.icons' },

  -- Which-key (keybinding hints)
  { src = gh('folke/which-key.nvim'), name = 'which-key' },
})

-- =============================================================================
-- Plugin Setup
-- =============================================================================

-- Colorscheme
vim.cmd.colorscheme 'nightfox'

-- Telescope
require('telescope').setup({
  defaults = {
    file_ignore_patterns = {
      "node_modules/",
      ".git/",
      ".next/",
      "coverage/",
      "%.lock",
      "dist/",
      "build/",
    },
    preview = { treesitter = true },
    -- Performance settings
    path_display = { "truncate" },
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = { prompt_position = "top" },
    },
  },
  pickers = {
    find_files = {
      hidden = true,  -- show hidden files
      follow = true,  -- follow symlinks
    },
  },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })

-- nvim-tree
require("nvim-tree").setup()
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>', { desc = 'Find file in tree' })

-- nvim-treesitter
local ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
if ok then
  ts_configs.setup({
    ensure_installed = {
      'ruby', 'javascript', 'typescript', 'tsx', 'python',
      'c', 'cpp', 'go', 'elixir', 'lua', 'vim', 'vimdoc',
      'html', 'css', 'json', 'yaml', 'markdown', 'bash',
    },
    highlight = { enable = true },
    indent = { enable = true },
  })
end

-- lualine
require('lualine').setup()

-- nvim-web-devicons
require("nvim-web-devicons").setup()

-- mini.surround
require('mini.surround').setup()

-- mini.indentscope
require('mini.indentscope').setup()

-- nvim-autopairs
require('nvim-autopairs').setup()

-- conform (formatting)
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    ruby = { "rubocop" },
  },
})

-- CopilotChat
require("CopilotChat").setup({
  debug = true,
})

-- Avante
require("avante").setup({
  hints = { enabled = false },
})

-- render-markdown (for Avante)
require("render-markdown").setup({
  file_types = { "markdown", "Avante" },
})

-- hardtime
require("hardtime").setup()

-- which-key
local wk = require("which-key")
wk.setup({
  preset = "modern",  -- or "classic", "helix"
})

-- Register key groups
wk.add({
  { "<leader>a", group = "AI/Claude" },
  { "<leader>f", group = "Find/Telescope" },
  { "<leader>n", group = "NvimTree" },
  { "<leader>g", group = "Git" },
  { "<leader>o", group = "OpenCode" },
  { "<leader>l", group = "LSP" },
  { "<leader>lw", group = "Workspace" },
})

-- claudecode
require("claudecode").setup()
vim.keymap.set('n', '<leader>ac', '<cmd>ClaudeCode<cr>', { desc = 'Toggle Claude' })
vim.keymap.set('n', '<leader>af', '<cmd>ClaudeCodeFocus<cr>', { desc = 'Focus Claude' })
vim.keymap.set('n', '<leader>ar', '<cmd>ClaudeCode --resume<cr>', { desc = 'Resume Claude' })
vim.keymap.set('n', '<leader>aC', '<cmd>ClaudeCode --continue<cr>', { desc = 'Continue Claude' })
vim.keymap.set('n', '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', { desc = 'Select Claude model' })
vim.keymap.set('n', '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>', { desc = 'Add current buffer' })
vim.keymap.set('v', '<leader>as', '<cmd>ClaudeCodeSend<cr>', { desc = 'Send to Claude' })
vim.keymap.set('n', '<leader>aa', '<cmd>ClaudeCodeDiffAccept<cr>', { desc = 'Accept diff' })
vim.keymap.set('n', '<leader>ad', '<cmd>ClaudeCodeDiffDeny<cr>', { desc = 'Deny diff' })

-- opencode
vim.g.opencode_opts = {}
vim.o.autoread = true
vim.keymap.set({ 'n', 'x' }, '<leader>oa', function() require('opencode').ask('@this: ', { submit = true }) end, { desc = 'Ask opencode' })
vim.keymap.set({ 'n', 'x' }, '<leader>os', function() require('opencode').select() end, { desc = 'Select opencode action' })
vim.keymap.set({ 'n', 't' }, '<leader>ot', function() require('opencode').toggle() end, { desc = 'Toggle opencode' })
vim.keymap.set({ 'n', 'x' }, '<leader>oo', function() return require('opencode').operator('@this ') end, { desc = 'Add range to opencode', expr = true })
vim.keymap.set('n', '<leader>ol', function() return require('opencode').operator('@this ') .. '_' end, { desc = 'Add line to opencode', expr = true })
vim.keymap.set('n', '<leader>ou', function() require('opencode').command('session.half.page.up') end, { desc = 'Scroll opencode up' })
vim.keymap.set('n', '<leader>od', function() require('opencode').command('session.half.page.down') end, { desc = 'Scroll opencode down' })

-- =============================================================================
-- Keymaps
-- =============================================================================
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, desc = 'Exit insert mode' })

-- Window navigation
vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { desc = 'Move to window below' })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { desc = 'Move to window above' })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { desc = 'Move to window right' })
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { desc = 'Move to window left' })

-- Clear highlights
vim.keymap.set('n', '<C-S>', ':nohlsearch<CR>', { noremap = true, silent = true, desc = 'Clear search highlights' })

-- Buffer navigation
vim.keymap.set('n', ']b', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Previous buffer' })
vim.keymap.set('n', '[b', ':bnext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })

-- Toggle relative line numbers
vim.keymap.set('n', '<leader>r', ':set rnu!<CR>', { noremap = true, silent = true, desc = 'Toggle relative numbers' })

-- %% expands to current file directory
vim.cmd([[cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%']])

-- =============================================================================
-- Autocmds
-- =============================================================================

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

-- =============================================================================
-- Other Settings
-- =============================================================================

-- Ack config (using silver searcher)
vim.g.ackprg = "ag --vimgrep --nocolor --nogroup --hidden --ignore-dir=node_modules --ignore-dir=.next --ignore-dir=.git --ignore-dir=coverage"

-- =============================================================================
-- LSP Configuration (Neovim 0.12 built-in)
-- =============================================================================
-- Language servers need to be installed separately:
--   Ruby:    gem install solargraph (or ruby-lsp)
--   JS/TS:   npm install -g typescript typescript-language-server
--   Python:  pip install pyright (or python-lsp-server)
--   C/C++:   brew install llvm (clangd) or install via system package manager
--   Go:      go install golang.org/x/tools/gopls@latest
--   Elixir:  https://github.com/elixir-lsp/elixir-ls (download release)

-- Configure each language server
vim.lsp.config('solargraph', {
  cmd = { vim.fn.expand('~/.rvm/wrappers/default/solargraph'), 'stdio' },
  filetypes = { 'ruby' },
  root_markers = { 'Gemfile', '.git' },
  settings = {
    solargraph = {
      diagnostics = true,
      completion = true,
      formatting = true,
    },
  },
})

vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
})

vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
  },
})

vim.lsp.config('clangd', {
  cmd = { 'clangd', '--background-index', '--clang-tidy' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = { 'compile_commands.json', 'compile_flags.txt', '.clangd', '.git' },
})

vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod', 'go.work', '.git' },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

vim.lsp.config('elixirls', {
  cmd = { 'elixir-ls' },  -- Ensure elixir-ls is in your PATH
  filetypes = { 'elixir', 'eelixir', 'heex', 'surface' },
  root_markers = { 'mix.exs', '.git' },
})

-- Enable all configured language servers
vim.lsp.enable({
  'solargraph',
  'ts_ls',
  'pyright',
  'clangd',
  'gopls',
  'elixirls',
})

-- LSP Keymaps (set when LSP attaches to a buffer)
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    -- Navigation
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = 'Go to declaration' }))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = 'Go to implementation' }))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'Find references' }))
    vim.keymap.set('n', 'gy', vim.lsp.buf.type_definition, vim.tbl_extend('force', opts, { desc = 'Go to type definition' }))

    -- Hover and signature
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Hover documentation' }))
    vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, vim.tbl_extend('force', opts, { desc = 'Signature help' }))

    -- Actions
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))
    vim.keymap.set({ 'n', 'v' }, '<leader>la', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code action' }))
    vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format({ async = true }) end, vim.tbl_extend('force', opts, { desc = 'Format buffer' }))

    -- Diagnostics
    vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, vim.tbl_extend('force', opts, { desc = 'Line diagnostics' }))
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, vim.tbl_extend('force', opts, { desc = 'Previous diagnostic' }))
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, vim.tbl_extend('force', opts, { desc = 'Next diagnostic' }))
    vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, vim.tbl_extend('force', opts, { desc = 'Diagnostics to loclist' }))

    -- Workspace
    vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, vim.tbl_extend('force', opts, { desc = 'Add workspace folder' }))
    vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, vim.tbl_extend('force', opts, { desc = 'Remove workspace folder' }))
    vim.keymap.set('n', '<leader>lwl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, vim.tbl_extend('force', opts, { desc = 'List workspace folders' }))
  end,
})

-- Diagnostic configuration
vim.diagnostic.config({
  virtual_text = { prefix = '●' },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = true,
  },
})
