local opts = {
    ensure_installed = {
        'lua',
        'vim',
        'vimdoc',
        'query',
        'markdown',
        'markdown_inline',
        'rust',
        'python',
    },
}

local function config()
    require('nvim-treesitter.configs').setup(opts)
end

return {
    'nvim-treesitter/nvim-treesitter',
    config = config,
    build = ':TSUpdate',
}

