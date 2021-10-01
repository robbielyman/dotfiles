vim.g.maplocallleader = '\\'
vim.g.python3_host_prog = '/Users/rylee/.pyenv/versions/3.9.0/bin/python'

require('settings')

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
vim.cmd 'autocmd TermOpen * setlocal listchars= nonumber norelativenumber'
vim.cmd 'autocmd TermOpen * startinsert'
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

require('plugins')

require('config')
