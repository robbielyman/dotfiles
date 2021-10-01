local cmp = require('cmp')

require('cmp').setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-i>'] = cmp.mapping.close(),
        ['<C-m>']  = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false,
        }),
        -- ['<CR>'] = cmp.mapping(function(fallback)
        --    if vim.fn.pumvisible() == 1 then
        --         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-i><CR>", true, true, true), "n")
        --     else
        --         fallback()
        --     end
        -- end),
    },
    sources = {
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'neorg' },
    },
}

