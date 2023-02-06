require("catppuccin").setup{
  flavor = "frappe",
  transparent_background = true,
  term_colors = true,
  styles = {
    booleans = { "bold" },
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    telescope = true,
    leap = true,
    markdown = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = {},
        warnings = { "italic" },
        information = {},
      },
      underlines = {
        errors = { "underline" },
        hints = {},
        warnings = { "underline" },
        information ={},
      },
    },
    treesitter = true,
    treesitter_context = true,
    lsp_trouble = true,
  },
  compile_path = vim.fn.stdpath "cache" .. "/catppuccin"
}

vim.cmd 'hi Conceal guibg = none'
vim.cmd.colorscheme "catppuccin"
