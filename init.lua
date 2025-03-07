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
    capabilities = capabilities
}

lspconfig['rust_analyzer'].setup{
    on_attach = function(client, bufnr)
        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, {bufnr = bufnr})
        end
    end,
}

