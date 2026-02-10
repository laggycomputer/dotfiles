return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
        event = "BufReadPre",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                Lua = {
                    hint = {
                        enable = true,
                    }
                },
            })
            vim.lsp.enable("lua_ls")

            vim.lsp.config("rust_analyzer", {
                capabilities = capabilities,
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
            })
            vim.lsp.enable("rust_analyzer")

            vim.lsp.config("pylyzer", {
                capabilities = capabilities,
                settings = {
                    python = {
                        checkOnType = true,
                        diagnostics = true,
                        inlayHints = true,
                        smartCompletion = true,
                    }
                },
                on_attach = function(client, bufnr)
                    if client.server_capabilities.inlayHintProvider then
                        vim.defer_fn(function()
                            -- print("enabling inlay on on", bufnr)
                            vim.lsp.inlay_hint.enable(true, {bufnr=bufnr})
                        end, 1500)
                    end
                end,
            })
            vim.lsp.enable("pylyzer")

            vim.lsp.config("tinymist", {
                capabilities = capabilities,
                settings = {
                    formatterMode = "typstyle",
                    exportPdf = "onType",
                    semanticTokens = "disable"
                }
            })
            vim.lsp.enable("tinymist")

            vim.lsp.config("clangd", {
                capabilities = capabilities,
            })
            vim.lsp.enable("clangd")

            vim.lsp.config("ts_ls", {
                filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
                cmd = { "typescript-language-server", "--stdio" }
            })
            vim.lsp.enable("ts_ls")

            -- npm i -g @astrojs/language-server
            vim.lsp.config("astro", {
                capabilities = capabilities,
            })
            vim.lsp.enable("astro")
        end
    }
}
