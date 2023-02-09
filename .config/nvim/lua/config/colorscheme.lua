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
        hints = { "underline" },
        warnings = { "underline" },
        information ={ "underline" },
      },
    },
    treesitter = true,
    treesitter_context = true,
    lsp_trouble = true,
  },
  compile_path = vim.fn.stdpath "cache" .. "/catppuccin",
  highlight_overrides = {
    frappe = function(frappe)
      return {
        Comment = { fg = frappe.flamingo },
        ["@comment"] = { fg = frappe.flamingo, style = { "italic" }},
        ["@constant"] = { fg = frappe.pink, style = { "bold" }},
        Constant = { fg = frappe.pink, style = { "bold" }},
        ["@variable"] = { fg = nil },
      }
    end
  }
}

vim.cmd 'hi Conceal guibg = none'
vim.cmd.colorscheme "catppuccin-frappe"
