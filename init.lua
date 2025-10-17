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

vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 99

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require("lazy").setup("plugins")

local options = { noremap = true }
vim.keymap.set("i", "jk", "<Esc>", options)

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn
--vim.cmd.colorscheme "gruvbox-material"
--require('onedark').setup {
  --style = 'warmer'
--}
--require('onedark').load()


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

-- Toggle relative line numbers using <leader>r
vim.keymap.set('n', '<leader>r', ':set rnu!<CR>', { noremap = true, silent = true })

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

-- Enable Git Blamer
vim.g.blamer_enabled = true

require("CopilotChat").setup {
  debug = true, -- Enable debugging
  -- See Configuration section for rest
}

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules"
    }
  }
}

-- Avante
-- deps:
require('cmp').setup ({
  -- use recommended settings from above
})
require('img-clip').setup ({
  -- use recommended settings from above
})
require('copilot').setup ({
  -- use recommended settings from above
})
require('render-markdown').setup ({
  -- use recommended settings from above
})
require('avante_lib').load()
require('avante').setup ({
  ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
  provider = "claude", -- Recommend using Claude
  auto_suggestions_provider = "claude", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-5-sonnet-20241022",
    temperature = 0,
    max_tokens = 4096,
  },
  ---Specify the special dual_boost mode
  ---1. enabled: Whether to enable dual_boost mode. Default to false.
  ---2. first_provider: The first provider to generate response. Default to "openai".
  ---3. second_provider: The second provider to generate response. Default to "claude".
  ---4. prompt: The prompt to generate response based on the two reference outputs.
  ---5. timeout: Timeout in milliseconds. Default to 60000.
  ---How it works:
  --- When dual_boost is enabled, avante will generate two responses from the first_provider and second_provider respectively. Then use the response from the first_provider as provider1_output and the response from the second_provider as provider2_output. Finally, avante will generate a response based on the prompt and the two reference outputs, with the default Provider as normal.
  ---Note: This is an experimental feature and may not work as expected.
  dual_boost = {
    enabled = false,
    first_provider = "claude",
    second_provider = "openai",
    prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
    timeout = 60000, -- Timeout in milliseconds
  },
  behaviour = {
    auto_suggestions = false, -- Experimental stage
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
    support_paste_from_clipboard = false,
    minimize_diff = true, -- Whether to remove unchanged lines when applying a code block
  },
  mappings = {
    --- @class AvanteConflictMappings
    diff = {
      ours = "co",
      theirs = "ct",
      all_theirs = "ca",
      both = "cb",
      cursor = "cc",
      next = "]x",
      prev = "[x",
    },
    suggestion = {
      accept = "<M-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
    jump = {
      next = "]]",
      prev = "[[",
    },
    submit = {
      normal = "<CR>",
      insert = "<C-s>",
    },
    sidebar = {
      apply_all = "A",
      apply_cursor = "a",
      switch_windows = "<Tab>",
      reverse_switch_windows = "<S-Tab>",
    },
  },
  hints = { enabled = true },
  windows = {
    ---@type "right" | "left" | "top" | "bottom"
    position = "right", -- the position of the sidebar
    wrap = true, -- similar to vim.o.wrap
    width = 30, -- default % based on available width
    sidebar_header = {
      enabled = true, -- true, false to enable/disable the header
      align = "center", -- left, center, right for title
      rounded = true,
    },
    input = {
      prefix = "> ",
      height = 8, -- Height of the input window in vertical layout
    },
    edit = {
      border = "rounded",
      start_insert = true, -- Start insert mode when opening the edit window
    },
    ask = {
      floating = false, -- Open the 'AvanteAsk' prompt in a floating window
      start_insert = true, -- Start insert mode when opening the ask window
      border = "rounded",
      ---@type "ours" | "theirs"
      focus_on_apply = "ours", -- which diff to focus after applying
    },
  },
  highlights = {
    ---@type AvanteConflictHighlights
    diff = {
      current = "DiffText",
      incoming = "DiffAdd",
    },
  },
  --- @class AvanteConflictUserConfig
  diff = {
    autojump = true,
    ---@type string | fun(): any
    list_opener = "copen",
    --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
    --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
    --- Disable by setting to -1.
    override_timeoutlen = 500,
  },
})
-- Avante End

-- Ack config
vim.g.ackprg = "ag --vimgrep --nocolor --nogroup --hidden --ignore-dir=node_modules --ignore-dir=.next --ignore-dir=.git --ignore-dir=coverage"

-- nvim.icons setup
require("nvim-web-devicons").setup()
