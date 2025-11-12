vim.g.mapleader = " "

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
vim.opt.wildmode = { "longest", "list" }
vim.opt.relativenumber = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.cursorline = true
vim.opt.ttyfast = true
vim.opt.spell = false
vim.opt.backupdir = "~/.cache/vim"
vim.opt.signcolumn = 'auto'
vim.opt.updatetime = 100
vim.opt.backup = true
vim.opt.writebackup = true
vim.opt.backupdir = vim.fn.stdpath("data") .. "/backup//"
vim.opt.mouse = "a"

vim.cmd([[colorscheme habamax]])

local telescope_builtin = require("telescope.builtin")

require("which-key").register({
    ["<leader>c"] = {
        name = "+code",
        a = { vim.lsp.buf.code_action, "Code Action" },
        D = { vim.lsp.buf.definition, "go to defintion" },
        d = { vim.lsp.buf.declaration, "go to declaration" },
        b = { vim.lsp.buf.type_definition, "go to type definition" },
        i = { vim.lsp.buf.implementation, "go to implementation(s)" },
        l = {
            function()
                vim.command("Guard lint")
            end,
            "Guard lint"
        },
        f = {
            function()
                vim.command("Guard fmt")
            end,
            "Guard fmt"
        },
        r = { vim.lsp.buf.rename, "refactor rename" },
        R = { vim.lsp.buf.references, "references" },
    },
    ["<leader>f"] = {
        name = "telescope",
        f = { telescope_builtin.find_files, "telescope find files" },
        g = { telescope_builtin.live_grep, "telescope live grep" },
        b = { telescope_builtin.buffers, "telescope buffers" },
        h = { telescope_builtin.help_tags, "telescope help tags" },
        u = { telescope_builtin.lsp_workspace_symbols, "telescope symbol usages" },
    },
})

vim.filetype.add({
    extension = {
        tpp = "cpp",
    },
})

