return {
  'scrooloose/nerdcommenter',
  { 'neoclide/coc.nvim', branch='release' },
  'lervag/vimtex',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
  },
  'ngmy/vim-rubocop',
  'prettier/vim-prettier',
  'github/copilot.vim',
  'mileszs/ack.vim',
  'lukas-reineke/indent-blankline.nvim',
  'simrat39/symbols-outline.nvim',
  'rebelot/kanagawa.nvim',
  'tpope/vim-rails',
  -- Use CopilotChat
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  --[[ On new systems install COC packages via
  CocInstall coc-vimtex coc-texlab
  --]]
  { "catppuccin/nvim", as = "catppuccin" },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  },
  'APZelos/blamer.nvim',
}
