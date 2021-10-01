vim.g.python3_host_prog = '/Users/rylee/.pyenv/versions/3.9.0/bin/python'

-- settings
local utils = require('utils')
local cmd = vim.cmd
local indent = 4
utils.opt('o', 'showmode', false)
utils.opt('o', 'hlsearch', false)
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'shiftwidth', indent)
cmd "call matchadd('ColorColumn', '\\%81v', 100)"
cmd 'setfiletype mail'

cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'arcticicestudio/nord-vim'
    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'tpope/vim-surround'
end)

require('config.colorscheme')
require('config.lualine')

local cmp = require('cmp')

cmp.setup {
    snippet = {},
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-k>']  = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },
    sources = {
        { name = 'buffer' },
        { name = 'path' },
    },
}
