local luasnip = require('luasnip')

vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-K>", "<Plug>luasnip-expand-or-jump", {})
vim.api.nvim_set_keymap("s", "<C-K>", "<Plug>luasnip-expand-or-jump", {})
