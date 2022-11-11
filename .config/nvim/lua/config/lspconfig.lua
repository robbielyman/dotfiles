local on_attach = function(_, bufnr)
    local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }

    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    map('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    map('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    map('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    map('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    map('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    map('n', '<Leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    map('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    map('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local uname = vim.loop.os_uname().sysname
local sumneko_root_path = uname == "Linux" and '/home/rylee/src/lua-language-server' or '/opt/homebrew/Cellar/lua-language-server'
local sumneko_binary = uname == "Linux" and sumneko_root_path.."/bin/Linux/lua-language-server" 
        or "/opt/homebrew/bin/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local libraries = vim.api.nvim_get_runtime_file("", true)
table.insert(libraries, uname == "Linux" and "/home/rylee/src/norns/lua" or "/Users/rylee/src/norns/lua")

require("lspconfig").sumneko_lua.setup {
    cmd = uname == "Linux" and {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
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
        chktex = {
            onEdit = true,
            onOpenAndSave = true,
        }
    },
    capabilities = capabilities,
    on_attach = on_attach,
}

require("lspconfig").clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

