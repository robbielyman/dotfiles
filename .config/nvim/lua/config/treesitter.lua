local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.markdown = {
  install_info = {
    url = "https://github.com/ryleelyman/tree-sitter-markdown", -- local path or git repo
    files = {"src/parser.c", "src/scanner.cc"},
    location = "tree-sitter-markdown",
    -- optional entries:
    branch = "split_parser", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    revision = 'f7160b1751deb17854aabbaa4d1bf70a3a55e295'
  },
}
parser_config.markdown_inline = {
  install_info = {
    url = "https://github.com/ryleelyman/tree-sitter-markdown", -- local path or git repo
    files = {"src/parser.c", "src/scanner.cc"},
    location = "tree-sitter-markdown-inline",
    -- optional entries:
    branch = "split_parser", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    revision = 'f7160b1751deb17854aabbaa4d1bf70a3a55e295'
  },
}
-- parser_config.latex = {
--   install_info = {
--     url = "https://github.com/ryleelyman/tree-sitter-latex",
--     files = {"src/parser.c", "src/scanner.c"},
--     generate_requires_npm = false,
--     requires_generate_from_grammar = false,
--     revision = '4e1c009f58f4e285ec4b8dfbaece3453bacc756a'
--   },
--   filetype = 'tex'
-- }

require('treesitter-context').setup {
  patterns = {
    tex = {
      'chapter',
      'section',
      'subsection',
      'subsubsection',
      'environment'
    }
  }
}

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "lua",
    "html",
    "vim",
    "latex",
    "cpp",
    "bibtex",
    "supercollider",
    "query",
    "javascript",
    "markdown",
    "markdown_inline",
    "help"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    }
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
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
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["av"] = "@block.outer",
        ["iv"] = "@block.inner",
      }
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
        ["]}"] = "@block.outer",
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
  },
}
