vim.g.mapleader = " "

require("config.lazy")

vim.opt.compatible = false
vim.opt.showmatch = true
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

require("which-key").add({
    { "grD", vim.lsp.buf.definition, desc = "go to defintion" },
    { "grd", vim.lsp.buf.declaration, desc = "go to declaration" },
    { "<leader>f", group = "telescope" },
    { "<leader>ff", telescope_builtin.find_files, desc = "telescope find files" },
    { "<leader>fg", telescope_builtin.live_grep, desc = "telescope live grep" },
    { "<leader>fb", telescope_builtin.buffers, desc = "telescope buffers" },
    { "<header>fh", telescope_builtin.help_tags, desc = "telescope help tags" },
    { "<leader>fs", telescope_builtin.lsp_workspace_symbols, desc = "telescope symbol usages" },
})

vim.filetype.add({
    extension = {
        tpp = "cpp",
    },
})

