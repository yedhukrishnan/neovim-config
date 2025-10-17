return {
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
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
  'navarasu/onedark.nvim',
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
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    "yetone/avante.nvim",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
      hints = { enabled = false }
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {}
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
        -- custom options here
    },
    config = function(_, opts)
        require("tokyodark").setup(opts) -- calling setup is optional
        vim.cmd [[colorscheme tokyodark]]
    end,
  },
  { 'nvim-mini/mini.icons', version = '*' },
  {
  "xTacobaco/cursor-agent.nvim",
  config = function()
    vim.keymap.set("n", "<leader>ca", ":CursorAgent<CR>", { desc = "Cursor Agent: Toggle terminal" })
    vim.keymap.set("v", "<leader>ca", ":CursorAgentSelection<CR>", { desc = "Cursor Agent: Send selection" })
    vim.keymap.set("n", "<leader>cA", ":CursorAgentBuffer<CR>", { desc = "Cursor Agent: Send buffer" })
  end,
}
}
