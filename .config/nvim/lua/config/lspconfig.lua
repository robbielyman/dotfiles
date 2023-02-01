-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', opts)
vim.keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', opts)
vim.keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', opts)
vim.keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', opts)
vim.keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', opts)
vim.keymap.set('n', 'gr', '<cmd>TroubleToggle lsp_references<cr>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local uname = vim.loop.os_uname().sysname

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local libraries = {"${3rd}/busted/library", "{$3rd}/luassert/library", unpack(vim.api.nvim_get_runtime_file("lua", true))}
table.insert(libraries, uname == "Linux" and "/home/rylee/src/norns/lua" or "/Users/rylee/src/norns/lua")

require("lspconfig.configs").supercollider = {
  default_config = {
    cmd = {'/Users/rylee/src/sclang-lsp-stdio/sclang-lsp-stdio.mjs',
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
  },
}

require("lspconfig").supercollider.setup{
  capabilities = capabilities,
  on_attach = on_attach
}

require("lspconfig").sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = libraries,
        checkThirdParty = false
      },
      telemetry = {
        enable = false,
      },
    },
  },
  capabilities = capabilities,
  on_attach = on_attach
}

require("lspconfig").texlab.setup {
  settings = {
  texlab = {
      chktex = {
        onEdit = true,
        onOpenAndSave = true,
      },
      rootDirectory = ".",
      forwardSearch = uname == "Linux" and {
        executable = "zathura",
        args = {"--synctex-forward", "%l:1:%f", "%p"},
      } or {
        executable = "/Applications/Skim.app/Contents/SharedSupport/displayline",
        args = {"%l", "%p", "%f"}
      },
      build = {
        onSave = true,
        forwardSearchAfter = true
      }
    },
  },
  capabilities = capabilities,
  on_attach = on_attach,
}

require("lspconfig").clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

require("lspconfig").hls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "haskell", "lhaskell", "tidal" },
  cmd = { "haskell-language-server-wrapper", "--lsp" }
}
