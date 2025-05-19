return {
    {
        "neovim/nvim-lspconfig",
        dependencies = { "mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
        event = "BufReadPre",
        config = function()
            -- Set up lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
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
            }

            lspconfig.pylyzer.setup({
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

            lspconfig["tinymist"].setup {
                capabilities = capabilities,
                settings = {
                    formatterMode = "typstyle",
                    exportPdf = "onType",
                    semanticTokens = "disable"
                }
            }

            lspconfig.clangd.setup {
                capabilities = capabilities,
            }

            lspconfig.ts_ls.setup {
                filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
                cmd = { "typescript-language-server", "--stdio" }
            }

            -- npm i -g @astrojs/language-server
            lspconfig['astro'].setup({
                capabilities = capabilities,
            })
        end
    }
}
