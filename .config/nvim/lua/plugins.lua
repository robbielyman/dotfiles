return require('packer').startup(function(use)
  -- packer
  use 'wbthomason/packer.nvim'

  -- colors
  use {'sam4llis/nvim-tundra',
    branch = 'dev'
  }

  -- discord
  use 'andweeb/presence.nvim'

  -- latex
  use '~/src/latex.nvim'

  -- tabline / status line
  use { 'kdheepak/tabline.nvim',
    requires = { { 'nvim-lualine/lualine.nvim', opt = true }, {'kyazdani42/nvim-web-devicons'} }
  }
  use { 'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- telescope
  use { 'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
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
