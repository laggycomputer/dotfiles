return {
    {
        "williamboman/mason.nvim",
        setup = function()
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
        opts = {
            ensure_installed = {
                "tinymist",
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        setup = function()
            require("mason-lspconfig").setup()
        end
    },
}
