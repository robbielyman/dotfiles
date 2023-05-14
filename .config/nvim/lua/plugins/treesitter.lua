return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false,
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      { 'gnn', desc = 'begin tree-sitter selection' },
    },
    opts = function()
      local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
      parser_config.io = {
        install_info = {
          url = "https://github.com/ryleelyman/tree-sitter-io",
          files = { 'src/parser.c' },
          branch = 'main'
        }
      }
      parser_config.prolog = {
        install_info = {
          url = "https://github.com/Rukiza/tree-sitter-prolog",
          files = { 'src/parser.c' },
          branch = 'main'
        }
      }
      return {
        highlight = { enable = true },
        indent = { enable = true },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        ensure_installed = {
          "bash",
          "help",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "vim",
          "latex",
          "cpp",
          "bibtex",
          "supercollider",
          "query",
          "io",
          "help",
          "regex",
          "comment",
          "yaml"
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25,
          persist_queries = false,
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          }
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              af = "@function.outer",
              ["if"] = "@function.inner",
              ac = "@class.outer",
              ic = "@class.inner",
              av = "@block.outer",
              iv = "@block.inner"
            }
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner"
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]}"] = "@class.outer",
              ["]]"] = "@block.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
              ["]{"] = "@block.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
              ["[{"] = "@block.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
              ["[}"] = "@block.outer",
            },
          },
          lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
              ["<leader>df"] = "@function.outer",
              ["<leader>dF"] = "@class.outer",
              ["<leader>ddf"] = "@block.outer",
            }
          }
        }
      }
    end,
    config = function (_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end
  },
  {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    cmd = 'TSPlaygroundToggle',
    lazy = true,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      patterns = {
        tex = {
          'chapter',
          'section',
          'subsection',
          'subsubsection',
          'environment'
        }
      }
    },
    lazy = true
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    lazy = true,
  }
}
