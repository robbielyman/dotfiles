local utils = require('utils')

local cmd = vim.cmd
local indent = 2

cmd 'syntax enable'
cmd 'filetype plugin indent on'
utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'tabstop', indent)
utils.opt('b', 'smartindent', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'splitright', true)
utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('o', 'showmode', false)
utils.opt('w', 'conceallevel', 2)
cmd 'nnoremap <leader>. :lcd %:p:h<CR>'
cmd 'hi Conceal guibg = none'
