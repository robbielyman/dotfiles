return require('packer').startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'

  -- colors
  use { "catppuccin/nvim", as = "catppuccin" }

  -- discord
  use 'andweeb/presence.nvim'

  -- alpha-nvim
  use {
    'Shatur/neovim-session-manager',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require('session_manager').setup{
        autoload_mode = require'session_manager.config'.AutoloadMode.Disabled,
        autosave_last_session = false,
      }
    end
  }
  use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  }

  -- latex
  use {'~/src/latex.nvim',
    requires = {{'nvim-lua/plenary.nvim'}}
  }

  -- tidal
  use '~/src/tidal.nvim'

  -- supercollider
  use '~/src/supercollider.nvim'

  -- tabline / status line
  use { 'kdheepak/tabline.nvim',
    requires = { { 'nvim-lualine/lualine.nvim', opt = true }, {'nvim-tree/nvim-web-devicons'} }
  }
  use { 'nvim-lualine/lualine.nvim',
    requires = {'nvim-tree/nvim-web-devicons', opt = true}
  }

  -- telescope
  use { 'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- trouble
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup{}
    end
  }
  -- tree-sitter
  use 'nvim-treesitter/playground'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- lsp
  use 'neovim/nvim-lspconfig'

  -- tree
  use 'luukvbaal/nnn.nvim'

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'ray-x/cmp-treesitter'
  use 'onsails/lspkind.nvim'

  -- snippets
  use 'L3MON4D3/LuaSnip'

  -- git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
  use { 'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('diffview').setup()
    end
  }

  -- autopairs
  use 'windwp/nvim-autopairs'
  use { 'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup{}
    end
  }
  -- use 'tpope/vim-surround'
  -- use 'ludovicchabant/vim-gutentags'

  -- leap
  use { 'ggandor/leap.nvim',
    config = function()
      require('leap').add_default_mappings()
    end
  }
end)
