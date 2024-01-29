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
  use 'prettier/vim-prettier'
  use 'github/copilot.vim'
  use 'mileszs/ack.vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'rebelot/kanagawa.nvim'
  --[[ On new systems install COC packages via
  CocInstall coc-vimtex coc-texlab
  --]]
  use { "catppuccin/nvim", as = "catppuccin" }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }
end)
