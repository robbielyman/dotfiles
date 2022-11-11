return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'arcticicestudio/nord-vim'
	use 'lervag/vimtex'
  use 'andweeb/presence.nvim'
  use '~/src/latex.nvim'
  use { 'kdheepak/tabline.nvim',
    requires = { { 'nvim-lualine/lualine.nvim', opt = true }, {'kyazdani42/nvim-web-devicons'} }
  }
	use { 'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use { 'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'luukvbaal/nnn.nvim'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'neovim/nvim-lspconfig'
  use 'dcampos/nvim-snippy'
  use 'dcampos/cmp-snippy'
  use 'windwp/nvim-autopairs'
  use 'saadparwaiz1/cmp_luasnip'
  use 'tpope/vim-surround'
  use 'tpope/vim-liquid'
  use 'ludovicchabant/vim-gutentags'
  use {
      'lewis6991/gitsigns.nvim',
      config = function()
          require('gitsigns').setup()
      end
  }
end)
