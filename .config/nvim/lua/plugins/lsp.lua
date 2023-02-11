return {
  {
    'neovim/nvim-lspconfig',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason.nvim',
      'trouble.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    opts = function()
      if vim.loop.os_uname().sysname ~= 'Linux' then
        require('lspconfig.configs').supercollider = {
          default_config = {
            cmd = {
              '/Users/rylee/src/sclang-lsp-stdio/sclang-lsp-stdio.mjs',
              '/Users/rylee/src/supercollider/build/Install/SuperCollider/SuperCollider.app/Contents/MacOS/sclang',
              '-d',
              '/tmp/log.txt',
            },
            filetypes = {'supercollider'},
            root_dir = require('lspconfig.util').find_git_ancestor,
            single_file_support = true,
          },
          settings = {},
          docs = {
            package_json = '',
            description = [[]],
            default_config = {
              root_dir = [[]],
            },
          }
        }
      end
      return {
        servers = {
          supercollider = vim.loop.os_uname().sysname ~= 'Linux' and {
            mason = false
          } or nil,
          sumneko_lua = {
            mason = false,
            settings = {
              Lua = {
                workspace = {
                  library = {
                    vim.loop.os_uname().sysname == 'Linux' and '/home/rylee/src/norns/lua' or '/Users/rylee/src/norns/lua'
                  },
                  checkThirdParty = false,
                },
                telemetry = {
                  enable = false,
                }
              }
            }
          },
          texlab = {
            mason = false,
            settings = {
              texlab = {
                chktex = {
                  onEdit = true,
                  onOpenAndSave = true,
                },
                rootDirectory = ".",
                forwardSearch = vim.loop.os_uname().sysname == 'Linux' and {
                  executable = 'zathura',
                  args = {"--synctex-forward", "%l:1:%f", "%p"},
                } or {
                    executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
                    args = {"%l", "%p", "%f"}
                  },
                build = {
                  onSave = true,
                  forwardSearchAfter = true
                }
              }
            }
          },
        },
        setup = {}
      }
    end,
    config = function(plugin, opts)
      local servers = opts.servers
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {silent = true})
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {silent = true})
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {silent = true})
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {silent = true})
      vim.keymap.set('n', 'gr', '<cmd>TroubleToggle lsp_references<CR>', {silent = true})

      local on_attach = function(_, bufnr)
        local bufopts = {silent = true, buffer = bufnr}
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<leader>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
      end

      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local function setup(server)
        local server_opts = vim.tbl_deep_extend('force', {
          capabilities = vim.deepcopy(capabilities),
          on_attach = on_attach
        }, servers[server] or {})

        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then return end
        elseif opts.setup['*'] then
          if opts.setup['*'](server, server_opts) then return end
        end
        require('lspconfig')[server].setup(server_opts)
      end

      local mlsp = require('mason-lspconfig')
      local available = mlsp.get_available_servers()
      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.mason == false or not vim.tbl_contains(available, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      require('mason-lspconfig').setup{ ensure_installed = ensure_installed }
      require('mason-lspconfig').setup_handlers{ setup }
    end,
  },
  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    lazy = true,
    config = true,
  }
}
