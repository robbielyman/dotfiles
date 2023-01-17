-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
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
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local uname = vim.loop.os_uname().sysname
local sumneko_root_path = uname == "Linux" and '/home/rylee/src/lua-language-server' or '/opt/homebrew/Cellar/lua-language-server'
local sumneko_binary = uname == "Linux" and sumneko_root_path.."/bin/Linux/lua-language-server"
or "/opt/homebrew/bin/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local libraries = vim.api.nvim_get_runtime_file("lua", true)
table.insert(libraries, "${3rd}/busted/library")
table.insert(libraries, "{$3rd}/luassert/library")
table.insert(libraries, uname == "Linux" and "/home/rylee/src/norns/lua" or "/Users/rylee/src/norns/lua")

require("lspconfig").sumneko_lua.setup {
  cmd = uname == "Linux" and {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"} or nil,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = libraries
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
