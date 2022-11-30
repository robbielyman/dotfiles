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
  use 'ryleelyman/latex.nvim'

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
  use 'dcampos/cmp-snippy'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'ray-x/cmp-treesitter'
  use 'onsails/lspkind.nvim'

  -- snippets
  use 'dcampos/nvim-snippy'

  -- gitsigns
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
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
end)
