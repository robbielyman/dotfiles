vim.keymap.set({'i', 's'}, "<C-K>", "<Plug>luasnip-expand-or-jump", {})
vim.keymap.set({'i', 's'}, "<C-E>", "<Plug>luasnip-next-choice", {})
vim.keymap.set('i', "<C-F>", "<cmd>lua require('luasnip.extras.otf').on_the_fly('e')<cr>")
vim.keymap.set('v', "<C-F>", "\"ec<cmd>lua require('luasnip.extras.otf').on_the_fly('e')<cr>")

require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/snippets"})
