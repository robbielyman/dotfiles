require('nvim-tundra').setup{
  transparent_background = true,
  dim_inactive_windows = {
    enabled = true,
  },
  plugins = {
    telescope = true,
    cmp = true,
    gitsigns = true,
  },
  syntax = {
    booleans = { bold = true, italic = true },
    comments = { bold = true, italic = true },
    conditionals = {},
    constants = { bold = true },
    fields = {},
    functions = {},
    keywords = {},
    loops = {},
    numbers = { bold = true },
    operators = { bold = true },
    punctuation = {},
    strings = {},
    types = { italic = true },
  },
  overwrite = {
    highlights = {
      ["@text.emphasis"] = { italic = true },
      ["@text.strong"] = { bold = true },
      ["@text.title"] = { bold = true },
    }
  }
}

vim.opt.background = 'dark'
vim.cmd('colorscheme tundra')

vim.cmd "let g:tex_conceal='abdmgs'"
vim.cmd 'hi Conceal guibg = none'
