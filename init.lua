-- =============================================================================
-- Neovim 0.12.0 Configuration using vim.pack
-- =============================================================================

-- Leader key (set before plugins)
vim.g.mapleader = ' '

-- Disable netrw (required for nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ui2 (new experimental UI in Neovim 0.12) is off because noice.nvim
-- handles the cmdline and messages. Re-enable it if you remove noice.
-- require('vim._core.ui2').enable({})

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
-- Note: showcmdloc defaults to 'last' which works with normal cmdheight
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

-- Quality-of-life
vim.opt.undofile = true                               -- Persistent undo across restarts (pairs with undotree)
vim.opt.signcolumn = 'yes'                            -- Always show sign column so the gutter doesn't jump
vim.opt.scrolloff = 8                                 -- Keep context lines around the cursor
vim.opt.splitright = true                             -- Vertical splits open to the right
vim.opt.splitbelow = true                             -- Horizontal splits open below

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

  -- Omarchy themes (catppuccin, gruvbox, kanagawa and nightfox/nordfox are above)
  { src = gh('folke/tokyonight.nvim'), name = 'tokyonight' },
  { src = gh('bjarneo/ethereal.nvim'), name = 'ethereal' },
  { src = gh('neanias/everforest-nvim'), name = 'everforest' },
  { src = gh('kepano/flexoki-neovim'), name = 'flexoki' },
  { src = gh('bjarneo/aether.nvim'), name = 'aether' },  -- needed by hackerman
  { src = gh('bjarneo/hackerman.nvim'), name = 'hackerman' },
  { src = gh('omacom-io/lumon.nvim'), name = 'lumon' },
  { src = gh('tahayvr/matteblack.nvim'), name = 'matteblack' },
  { src = gh('OldJobobo/miasma.nvim'), name = 'miasma' },
  { src = gh('ribru17/bamboo.nvim'), name = 'bamboo' },  -- osaka-jade
  { src = gh('OldJobobo/retro-82.nvim'), name = 'retro-82' },
  { src = gh('loctvl842/monokai-pro.nvim'), name = 'monokai-pro' },  -- ristretto
  { src = gh('rose-pine/neovim'), name = 'rose-pine' },
  { src = gh('bjarneo/vantablack.nvim'), name = 'vantablack' },
  { src = gh('bjarneo/white.nvim'), name = 'white' },

  -- Snacks (picker: files, grep, buffers, themes, ...)
  { src = gh('folke/snacks.nvim'), name = 'snacks' },
  { src = gh('nvim-lua/plenary.nvim'), name = 'plenary' },  -- needed by CopilotChat

  -- File tree
  { src = gh('nvim-tree/nvim-tree.lua'), name = 'nvim-tree' },
  { src = gh('nvim-tree/nvim-web-devicons'), name = 'nvim-web-devicons' },

  -- Status line
  { src = gh('nvim-lualine/lualine.nvim'), name = 'lualine' },

  -- Git integration
  { src = gh('tpope/vim-fugitive'), name = 'vim-fugitive' },
  { src = gh('tpope/vim-rhubarb'), name = 'vim-rhubarb' },
  { src = gh('lewis6991/gitsigns.nvim'), name = 'gitsigns' },

  -- Editing enhancements
  { src = gh('windwp/nvim-autopairs'), name = 'nvim-autopairs' },
  { src = gh('echasnovski/mini.surround'), name = 'mini.surround' },
  -- Note: mini.indentscope is now redundant with built-in indent-blankline improvements
  -- but keeping if you prefer its visual style
  { src = gh('echasnovski/mini.indentscope'), name = 'mini.indentscope' },

  -- Treesitter (syntax highlighting, folding, text objects)
  { src = gh('nvim-treesitter/nvim-treesitter'), name = 'nvim-treesitter' },
  { src = gh('nvim-treesitter/nvim-treesitter-textobjects'), name = 'nvim-treesitter-textobjects', version = 'main' },
  { src = gh('nvim-treesitter/nvim-treesitter-context'), name = 'nvim-treesitter-context' },
  { src = gh('windwp/nvim-ts-autotag'), name = 'nvim-ts-autotag' },

  -- Formatting
  { src = gh('stevearc/conform.nvim'), name = 'conform' },

  -- Rails development
  { src = gh('tpope/vim-rails'), name = 'vim-rails' },

  -- LaTeX
  { src = gh('lervag/vimtex'), name = 'vimtex' },

  -- AI assistants
  { src = gh('github/copilot.vim'), name = 'copilot' },
  { src = gh('CopilotC-Nvim/CopilotChat.nvim'), name = 'CopilotChat' },

  -- Claude integration
  { src = gh('coder/claudecode.nvim'), name = 'claudecode' },

  -- Mini icons (dependency for several plugins)
  { src = gh('echasnovski/mini.icons'), name = 'mini.icons' },

  -- Which-key (keybinding hints)
  { src = gh('folke/which-key.nvim'), name = 'which-key' },

  -- JSON schemas
  { src = gh('b0o/schemastore.nvim'), name = 'schemastore' },

  -- Noice (floating cmdline, messages and notifications; requires nui)
  { src = gh('MunifTanjim/nui.nvim'), name = 'nui' },
  { src = gh('folke/noice.nvim'), name = 'noice' },

  -- Wakatime (time tracking)
  { src = gh('wakatime/vim-wakatime'), name = 'vim-wakatime' },
})

-- =============================================================================
-- Plugin Setup
-- =============================================================================

-- Colorscheme (persisted across sessions)
local theme_file = vim.fn.stdpath('data') .. '/last_theme'

-- Theme settings that match Omarchy
pcall(function() require('everforest').setup({ background = 'soft' }) end)
pcall(function()
  require('monokai-pro').setup({
    filter = 'ristretto',
    override = function()
      return {
        NonText = { fg = '#948a8b' },
        MiniIconsGrey = { fg = '#948a8b' },
        MiniIconsRed = { fg = '#fd6883' },
        MiniIconsBlue = { fg = '#85dacc' },
        MiniIconsGreen = { fg = '#adda78' },
        MiniIconsYellow = { fg = '#f9cc6c' },
        MiniIconsOrange = { fg = '#f38d70' },
        MiniIconsPurple = { fg = '#a8a9eb' },
        MiniIconsAzure = { fg = '#a8a9eb' },
        MiniIconsCyan = { fg = '#85dacc' },
      }
    end,
  })
end)

-- Load last theme, fall back to kanagawa
local theme_ok, saved_theme = pcall(vim.fn.readfile, theme_file)
pcall(vim.cmd.colorscheme, (theme_ok and saved_theme[1]) or 'kanagawa')

-- Re-save whenever the colorscheme changes (covers the theme picker too)
vim.api.nvim_create_autocmd('ColorScheme', {
  callback = function(args) pcall(vim.fn.writefile, { args.match }, theme_file) end,
})

-- Snacks picker (only the picker is enabled; other snacks modules stay off)
local picker_exclude = { "node_modules", ".git", ".next", "coverage", "*.lock", "dist", "build" }
require('snacks').setup({
  picker = {
    enabled = true,
    sources = {
      files = { hidden = true, follow = true, exclude = picker_exclude },
      grep = { hidden = true, exclude = picker_exclude },
      grep_word = { hidden = true, exclude = picker_exclude },
    },
  },
})

-- Disable autocomplete in the picker prompt
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'snacks_picker_input',
  callback = function()
    vim.opt_local.autocomplete = false
  end,
})

local picker = function(name, opts)
  return function() Snacks.picker[name](opts) end
end
-- Same keys as before
vim.keymap.set('n', '<leader>p', picker('files'), { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', picker('grep'), { desc = 'Live grep' })
vim.keymap.set('n', '<leader>b', picker('buffers'), { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', picker('help'), { desc = 'Help tags' })
vim.keymap.set('n', '<leader>ft', picker('colorschemes'), { desc = 'Themes (preview)' })
-- New
vim.keymap.set('n', '<leader><space>', picker('smart'), { desc = 'Smart find (recent + files)' })
vim.keymap.set('n', '<leader>fr', picker('recent'), { desc = 'Recent files' })
vim.keymap.set({ 'n', 'x' }, '<leader>fw', picker('grep_word'), { desc = 'Grep word / selection' })
vim.keymap.set('n', '<leader>f/', picker('lines'), { desc = 'Search current buffer' })
vim.keymap.set('n', '<leader>fd', picker('diagnostics'), { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>fs', picker('lsp_symbols'), { desc = 'LSP symbols (file)' })
vim.keymap.set('n', '<leader>fS', picker('lsp_workspace_symbols'), { desc = 'LSP symbols (workspace)' })
vim.keymap.set('n', '<leader>fk', picker('keymaps'), { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>fc', picker('command_history'), { desc = 'Command history' })
vim.keymap.set('n', '<leader>fu', picker('undo'), { desc = 'Undo history' })
vim.keymap.set('n', '<leader>fl', picker('git_log'), { desc = 'Git log' })
vim.keymap.set('n', '<leader>fq', picker('qflist'), { desc = 'Quickfix list' })
vim.keymap.set('n', '<leader>f.', picker('resume'), { desc = 'Resume last picker' })

-- nvim-tree
require("nvim-tree").setup()
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>', { desc = 'Find file in tree' })

-- nvim-treesitter (main branch API)
require('nvim-treesitter').install({
  'ruby', 'embedded_template', 'javascript', 'typescript', 'tsx', 'python',
  'c', 'cpp', 'go', 'elixir', 'lua', 'vim', 'vimdoc',
  'html', 'css', 'json', 'yaml', 'markdown', 'markdown_inline', 'bash',
})

-- On the main branch, highlighting & indent are opt-in per buffer.
-- Only start treesitter when the parser is actually available; otherwise
-- leave the built-in regex syntax on as a fallback (e.g. while parsers are
-- still downloading on first launch) so files are never left unhighlighted.
vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
    if lang and vim.treesitter.language.add(lang) then
      vim.treesitter.start(args.buf, lang)
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- nvim-treesitter-textobjects (main branch: keymaps are set by hand)
require('nvim-treesitter-textobjects').setup({
  select = { lookahead = true },  -- jump forward to the next match if not inside one
  move = { set_jumps = true },    -- record moves in the jumplist (<C-o> to go back)
})

local ts_select = require('nvim-treesitter-textobjects.select')
for keys, query in pairs({
  af = '@function.outer', ['if'] = '@function.inner',
  ac = '@class.outer',    ic = '@class.inner',
  aa = '@parameter.outer', ia = '@parameter.inner',
  ab = '@block.outer',    ib = '@block.inner',
}) do
  vim.keymap.set({ 'x', 'o' }, keys, function()
    ts_select.select_textobject(query, 'textobjects')
  end, { desc = 'TS ' .. query })
end

local ts_move = require('nvim-treesitter-textobjects.move')
vim.keymap.set({ 'n', 'x', 'o' }, ']f', function() ts_move.goto_next_start('@function.outer', 'textobjects') end, { desc = 'Next function' })
vim.keymap.set({ 'n', 'x', 'o' }, '[f', function() ts_move.goto_previous_start('@function.outer', 'textobjects') end, { desc = 'Previous function' })
vim.keymap.set({ 'n', 'x', 'o' }, ']k', function() ts_move.goto_next_start('@class.outer', 'textobjects') end, { desc = 'Next class' })
vim.keymap.set({ 'n', 'x', 'o' }, '[k', function() ts_move.goto_previous_start('@class.outer', 'textobjects') end, { desc = 'Previous class' })

local ts_swap = require('nvim-treesitter-textobjects.swap')
vim.keymap.set('n', '<leader>sn', function() ts_swap.swap_next('@parameter.inner') end, { desc = 'Swap with next argument' })
vim.keymap.set('n', '<leader>sp', function() ts_swap.swap_previous('@parameter.inner') end, { desc = 'Swap with previous argument' })

-- nvim-treesitter-context (pin the current function/class header at the top)
require('treesitter-context').setup({ max_lines = 3 })
vim.keymap.set('n', '[x', function() require('treesitter-context').go_to_context(vim.v.count1) end, { desc = 'Jump to context' })

-- nvim-ts-autotag (auto close/rename HTML, ERB, JSX tags)
require('nvim-ts-autotag').setup()

-- lualine
require('lualine').setup({
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      'branch',
      {
        'diff',
        -- Reuse gitsigns' counts so they match the gutter signs
        source = function()
          local g = vim.b.gitsigns_status_dict
          if g then
            return { added = g.added, modified = g.changed, removed = g.removed }
          end
        end,
      },
      'diagnostics',
    },
    lualine_c = {
      {
        'filename',
        path = 1,  -- path relative to the project root
        symbols = { modified = '[+]', readonly = '[RO]', unnamed = '[No Name]', newfile = '[New]' },
      },
    },
    lualine_x = {
      { 'lsp_status', ignore_lsp = { 'GitHub Copilot' } },
      -- Only show encoding / line endings when they're unusual
      { 'encoding', cond = function() return vim.bo.fileencoding ~= '' and vim.bo.fileencoding ~= 'utf-8' end },
      { 'fileformat', cond = function() return vim.bo.fileformat ~= 'unix' end },
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = {
      'location',
      {
        function()
          return 'recording @' .. vim.fn.reg_recording()
        end,
        cond = function()
          return vim.fn.reg_recording() ~= ''
        end,
      },
    },
  },
  options = {
    theme = 'auto',       -- Follow the active colorscheme
    globalstatus = true,  -- Use global statusline
  },
  extensions = { 'nvim-tree', 'fugitive', 'quickfix' },
})

-- Ensure statusline is always visible (required when cmdheight = 0)
vim.opt.laststatus = 3  -- Global statusline across all windows

-- nvim-web-devicons
require("nvim-web-devicons").setup()

-- mini.surround
require('mini.surround').setup()

-- mini.indentscope
require('mini.indentscope').setup()

-- nvim-autopairs
require('nvim-autopairs').setup()

-- gitsigns (inline git signs, hunk staging, blame)
require('gitsigns').setup({
  on_attach = function(bufnr)
    local gs = require('gitsigns')
    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
    end

    -- Navigation between hunks
    map('n', ']c', function() gs.nav_hunk('next') end, 'Next git hunk')
    map('n', '[c', function() gs.nav_hunk('prev') end, 'Previous git hunk')

    -- Actions
    map('n', '<leader>gs', gs.stage_hunk, 'Stage hunk')
    map('n', '<leader>gr', gs.reset_hunk, 'Reset hunk')
    map('v', '<leader>gs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Stage hunk')
    map('v', '<leader>gr', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Reset hunk')
    map('n', '<leader>gS', gs.stage_buffer, 'Stage buffer')
    map('n', '<leader>gp', gs.preview_hunk, 'Preview hunk')
    map('n', '<leader>gb', function() gs.blame_line({ full = true }) end, 'Blame line')
    map('n', '<leader>gd', gs.diffthis, 'Diff against index')
  end,
})

-- conform (formatting)
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", "prettier", stop_after_first = true },
    javascriptreact = { "prettierd", "prettier", stop_after_first = true },
    typescript = { "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "prettierd", "prettier", stop_after_first = true },
    ruby = { "rubocop" },
  },
})

-- Add direct conform formatting keymap
vim.keymap.set('n', '<leader>cf', function()
  require("conform").format({ async = true })
end, { desc = 'Format with conform' })

-- CopilotChat
require("CopilotChat").setup({
  debug = true,
})

-- which-key
local wk = require("which-key")
wk.setup({
  preset = "modern",  -- or "classic", "helix"
})

-- Register key groups
wk.add({
  { "<leader>a", group = "AI/Claude" },
  { "<leader>f", group = "Find" },
  { "<leader>n", group = "NvimTree / Noice" },
  { "<leader>g", group = "Git" },
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

-- Reload files changed outside Neovim
vim.o.autoread = true

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
vim.keymap.set('n', '[b', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Previous buffer' })
vim.keymap.set('n', ']b', ':bnext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })

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
  cmd = { 'solargraph', 'stdio' },  -- from PATH, so it follows the active RVM Ruby
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

vim.lsp.config('jsonls', {
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  root_markers = { '.git' },
  on_attach = function(client, bufnr)
    client.settings = vim.tbl_deep_extend('force', client.settings or {}, {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    })
    client.notify('workspace/didChangeConfiguration', { settings = client.settings })
  end,
})

-- Enable all configured language servers
vim.lsp.enable({
  'solargraph',
  'ts_ls',
  'pyright',
  'clangd',
  'gopls',
  'elixirls',
  'jsonls',
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

-- Noice
require('noice').setup({
  lsp = {
    -- Render LSP hover/signature docs with Treesitter markdown
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
    },
  },
  presets = {
    bottom_search = true,         -- classic bottom cmdline for / and ?
    command_palette = true,       -- cmdline and completion popup together
    long_message_to_split = true, -- long messages open in a split
    lsp_doc_border = true,        -- border around hover docs and signature help
  },
})
vim.keymap.set('n', '<leader>nh', '<cmd>Noice history<cr>', { desc = 'Message history' })
vim.keymap.set('n', '<leader>nd', '<cmd>Noice dismiss<cr>', { desc = 'Dismiss notifications' })
