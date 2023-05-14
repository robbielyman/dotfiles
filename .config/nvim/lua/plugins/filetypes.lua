return {
  {
    dir = '~/src/latex.nvim',
    name = 'latex',
    dev = true,
    lazy = true,
    ft = { 'tex', 'markdown' },
    opts = {
      imaps = {
        add = {
          ["\\colon"] = ":",
          ["\\tilde"] = "~",
        },
      },
      conceals = {
        add = {
          ["colon"] = ":"
        },
      },
    }
  },
  {
    dir = '~/src/tidal.nvim',
    name = 'tidal',
    dev = true,
    lazy = true,
    ft = 'tidal',
    opts = {
      boot = {
        sclang = {
          enabled = true
        }
      }
    }
  },
  {
    dir = '~/src/supercollider.nvim',
    name = 'supercollider',
    dev = true,
    lazy = true,
    ft = { 'scala', 'supercollider' },
    opts = {
      boot = {
        enabled = true,
        split = 'v'
      },
      keymaps = {
        send_node = "<Leader>n"
      }
    }
  }
}
