return {
  -- snippets
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = 'TextChanged',
    },
    keys = {
      {'<C-K>', '<Plug>luasnip-expand-or-jump',
        remap = true, expr = true, silent = true, mode = 'i', remap = true },
      {'<C-E>', '<Plug>luasnip-next-choice', mode = 'i' },
      {'<C-F>', '<cmd>lua require("luasnip.extras.otf").on_the_fly("e")<CR>', mode = 'i' },
      {'<C-F>', '"ec<cmd>lua require("luasnip.extras.otf").on_the_fly("e")<CR>', mode = 'v'}
    },
    lazy = true,
  },
  -- completion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    lazy = true,
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'ray-x/cmp-treesitter',
      'onsails/lspkind.nvim'
    },
    opts = function()
      local cmp = require('cmp')
      return {
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        snippet = {
          expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
          end
        },
        formatting = {
          format = require'lspkind'.cmp_format{
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...',
          }
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
        cmp.setup.cmdline{ '/', '?' }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        },
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources{
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          }
        })
      }
    end,
  },
  -- pairs
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    lazy = true,
    config = function (_, opts)
      require('mini.pairs').setup(opts)
    end,
  },
  -- surround
  {
    'echasnovski/mini.surround',
    lazy = true,
    keys = function(_, keys)
      -- Populate the keys based on the user's options
      local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add, desc = "Add surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "Delete surrounding" },
        { opts.mappings.find, desc = "Find right surrounding" },
        { opts.mappings.find_left, desc = "Find left surrounding" },
        { opts.mappings.highlight, desc = "Highlight surrounding" },
        { opts.mappings.replace, desc = "Replace surrounding" },
        { opts.mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
      }
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "gza", -- Add surrounding in Normal and Visual modes
        delete = "gzd", -- Delete surrounding
        find = "gzf", -- Find surrounding (to the right)
        find_left = "gzF", -- Find surrounding (to the left)
        highlight = "gzh", -- Highlight surrounding
        replace = "gzr", -- Replace surrounding
        update_n_lines = "gzn", -- Update `n_lines`
      },
    },
    config = function(_, opts)
      -- use gz mappings instead of s to prevent conflict with leap
      require("mini.surround").setup(opts)
    end,
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring', lazy = true },
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = {
      hooks = {
        pre = function()
          require('ts_context_commentstring.internal').update_commentstring{}
        end,
      },
    },
    config = function(_, opts)
      require('mini.comment').setup(opts)
    end,
  },
}
