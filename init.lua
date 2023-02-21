require("plugins")

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
vim.opt.backspace = indent,eol,start
vim.opt.cursorline = true

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

require("nvim-tree").setup()
vim.keymap.set('n', '<leader>nf', [[:NvimTreeFindFile<CR>]], {})
require('lualine').setup()

-- Remove trailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})
