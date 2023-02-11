vim.g.mapleader = ' '

function P(table)
  print(vim.inspect(table))
  return table
end

function RELOAD(...)
  return require("plenary.reload").reload_module(...)
end

function R(name)
  RELOAD(name)
  return require(name)
end

vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'

local function set_opts(args)
  for key, value in pairs(args) do
    if type(value) ~= 'table' then
      value = { value }
    end
    vim.o[key] = value[1]
    if value.scope then
      vim[value.scope][key] = value[1]
    end
  end
end

set_opts {
  expandtab = { true, scope = 'bo'},
  shiftwidth = { 2, scope = 'bo'},
  tabstop = { 2, scope = 'bo'},
  number = { true, scope = 'wo'},
  relativenumber = { true, scope = 'wo'},
  showmode = false,
  conceallevel = { 2, scope = 'wo'},
  foldmethod = 'expr',
  foldexpr = 'nvim_treesitter#foldexpr()',
  termguicolors = true,
  foldenable = false,
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd("TermOpen", {
  command = "setlocal listchars= nonumber norelativenumber"
})

require('lazy').setup("plugins")
