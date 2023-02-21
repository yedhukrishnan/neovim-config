return require('packer').startup(function()
  local use = use
  use 'wbthomason/packer.nvim'
  use 'scrooloose/nerdcommenter'
  use { 'neoclide/coc.nvim', branch='release' }
  use 'lervag/vimtex'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'ngmy/vim-rubocop'
  use 'github/copilot.vim'
  use 'mileszs/ack.vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'simrat39/symbols-outline.nvim'
  --[[ On new systems install COC packages via
  CocInstall coc-vimtex coc-texlab
  --]]
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
end)
