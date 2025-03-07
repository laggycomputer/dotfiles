require("config.lazy")

vim.opt.compatible = false
vim.opt.showmatch = true
vim.opt.mouse = "v"
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.wildmode = {"longest", "list"}
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true
vim.opt.ttyfast = true
vim.opt.spell = false
vim.opt.backupdir = "~/.cache/vim"
vim.opt.signcolumn = 'auto'
vim.opt.updatetime = 100

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

local lspconfig = require('lspconfig')
--
lspconfig['lua_ls'].setup {
    capabilities = capabilities,
    Lua = {
        hint = {
            enable = true,
        }
    },
}

lspconfig['rust_analyzer'].setup{
    on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
            vim.defer_fn(function()
                -- print("enabling inlay on on", bufnr)
                vim.lsp.inlay_hint.enable(true, {bufnr=bufnr})
            end, 1500)
        end
    end,
    settings = {
        ["rust-analyzer"] = {
            inlayHints = {
                bindingModeHints = {
                    enable = true,
                },
                chainingHints = {
                    enable = true,
                },
                closingBraceHints = {
                    enable = true,
                    minLines = 25,
                },
                closureReturnTypeHints = {
                    enable = "always",
                },
                lifetimeElisionHints = {
                    enable = "never",
                    useParameterNames = false,
                },
                maxLength = 25,
                parameterHints = {
                    enable = true,
                },
                reborrowHints = {
                    enable = "never",
                },
                renderColons = true,
                typeHints = {
                    enable = true,
                    hideClosureInitialization = false,
                    hideNamedConstructor = false,
                },
            },
            cargo = {
                allFeatures = true
            },
        }
    }
}

