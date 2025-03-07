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

        end
    },
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
