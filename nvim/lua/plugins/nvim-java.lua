return {
    'nvim-java/nvim-java',
    config = function()
        require('java').setup()
        vim.lsp.enable('jdtls')

        vim.lsp.config('jdtls', {
            settings = {
                java = {
                    configuration = {
                        runtimes = {
                            {
                                name = "coretto 1.8",
                                path = "/home/dante/.jdks/corretto-1.8.0_462",
                                default = true,
                            }
                        }
                    }
                }
            }
        })
    end,
}
