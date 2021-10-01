require("tabline").setup {
    enable = true,
    options = {
        show_tabs_always = false,
        show_devicons = true,
        show_bufnr = true,
        show_filename_only = false,
    }
}
vim.cmd "set sessionoptions+=tabpages,globals"
