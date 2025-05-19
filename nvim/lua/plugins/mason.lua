return {
    {
        "williamboman/mason.nvim",
        config = function()
            -- Mason Setup
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                    },
                }
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        setup = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua-language-server",
                    "rust-analyzer",
                    "tinymist",
                    "clangd",
                    "typescript-language-server",
                    "astro-language-server",
                },
                automatic_installation = true,
            })
        end,
    },
}
