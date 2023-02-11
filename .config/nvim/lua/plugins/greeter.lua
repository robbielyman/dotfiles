return {
    {
    'goolord/alpha-nvim',
    name = 'alpha',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = function ()
      local dashboard = require'alpha.themes.dashboard'
      dashboard.section.header.val = {
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "██╗  ██╗██╗██╗   ██╗ █████╗ ██╗",
        "██║  ██║██║╚██╗ ██╔╝██╔══██╗██║",
        "███████║██║ ╚████╔╝ ███████║██║",
        "██╔══██║██║  ╚██╔╝  ██╔══██║╚═╝",
        "██║  ██║██║   ██║   ██║  ██║██╗",
        "╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝",
      }
      dashboard.section.buttons.val = {
        dashboard.button("e", "  => new file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "  => find file", ":Telescope find_files<CR>"),
        dashboard.button("r", "  => recent files", ":Telescope oldfiles<CR>"),
        dashboard.button("s", "  => settings", ":e $MYVIMRC | cd %:p:h | split | wincmd k | NnnExplorer<CR>"),
        dashboard.button("l", "  => load session", ":SessionManager load_session<CR>"),
        dashboard.button("q", "  => quit", ":qa<CR>")
      }
      dashboard.section.footer.val = {
        '',
        '',
        '',
        '',
        '"You get up early in the morning',
        '      and you work all day.',
        '   That\'s the only secret."',
        '                     -- Philip Glass'
      }
      return dashboard.opts
    end,
    config = true,
  },
  {
    'Shatur/neovim-session-manager',
    name = 'session_manager',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = 'alpha',
    lazy = true,
    cmd = 'SessionManager',
    opts = function ()
      return {
        autoload_mode = require'session_manager.config'.AutoloadMode.Disabled,
        autosave_last_session = false,
      }
    end
  }
}
