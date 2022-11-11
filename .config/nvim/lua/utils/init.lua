local utils = { }

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function utils.opt(scope, key, value)
	scopes[scope][key] = value
	if scope ~= 'o' then scopes['o'][key] = value end
end

function utils.map(mode, lhs, rhs, opts)
	local options = {noremap = true}
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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

return utils
