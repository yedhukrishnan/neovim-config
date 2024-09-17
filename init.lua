vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.showcmd = true
vim.opt.lazyredraw = true
vim.opt.ic = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.backspace = [[indent,eol,start]]
vim.opt.cursorline = true
vim.opt.history = 1000


require('plugins')

vim.g.mapleader = ' '

local options = { noremap = true }
vim.keymap.set("i", "jk", "<Esc>", options)

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
vim.cmd.colorscheme "catppuccin-mocha"

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<C-J>', '<C-W><C-J>', {})
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', {})
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', {})
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', {})

-- Clear highlights with <C-S>
vim.keymap.set('n', '<C-S>', ':nohlsearch<CR>', { noremap = true, silent = true })

-- Remap buffer next/previous
vim.keymap.set('n', ']b', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '[b', ':bnext<CR>', { noremap = true, silent = true })

-- %% expands to current file directory
vim.cmd([[
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
]])

require("nvim-tree").setup()
vim.keymap.set('n', '<leader>nf', [[:NvimTreeFindFile<CR>]], {})
require('lualine').setup()
require("ibl").setup()

-- Remove trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

local packer_exists = pcall(vim.cmd, [[packadd packer.nvim]])

if not packer_exists then
  local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
  vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', packer_path })
  vim.cmd([[packadd packer.nvim]])
end

-- Enable Git Blamer
vim.g.blamer_enabled = true

require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
}
