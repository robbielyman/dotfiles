local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

-- These two are optional and provide syntax highlighting
-- for Neorg tables and the @document.meta tag
parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}

require('nvim-treesitter.configs').setup {
    ensure_installed = {"norg", "norg_meta", "norg_table", "lua", "html", "vim", "latex", "cpp", "bibtex", "supercollider"},
    highlight = {
        enable = true,
        -- disable = { "latex" },
        additional_vim_regex_highlighting = true,
    },
}
