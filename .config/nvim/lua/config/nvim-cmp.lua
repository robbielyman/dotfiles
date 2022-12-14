local cmp = require('cmp')
local lspkind = require('lspkind')
lspkind.init()

require('cmp').setup {
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  formatting = {
    format = lspkind.cmp_format({
        mode = 'symbol',
        maxwidth = 50,
        ellipsis_char = '...',
    })
  },
  experimental = { ghost_text = true },
  mapping = cmp.mapping.preset.insert(),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'buffer' , keyword_length = 5 },
    { name = 'nvim_lsp_signature_help' },
    { name = 'treesitter' },
    { name = 'path' },
  },
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  }),
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
}
