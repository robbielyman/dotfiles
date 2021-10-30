local utils = require('utils')
local cmd = vim.cmd

utils.opt('o', 'termguicolors', true)
cmd 'colorscheme nord'
-- cmd 'hi Normal guibg=NONE ctermbg=NONE'
