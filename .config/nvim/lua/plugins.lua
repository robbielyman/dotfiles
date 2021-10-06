return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'arcticicestudio/nord-vim'
	use 'lervag/vimtex'
    use 'andweeb/presence.nvim'
--  use '~/Documents/tex-nvim'
    use { 'kdheepak/tabline.nvim',
        requires = { { 'shadmansaleh/lualine.nvim', opt = true }, {'kyazdani42/nvim-web-devicons'} }
    }
	use { 'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
	}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use { 'shadmansaleh/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use { "nvim-neorg/neorg",
        branch = "unstable",
        requires = "nvim-lua/plenary.nvim"
    }
    use { 'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
    }
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'neovim/nvim-lspconfig'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'tpope/vim-surround'
    use 'tpope/vim-liquid'
    use 'ludovicchabant/vim-gutentags'
end)
