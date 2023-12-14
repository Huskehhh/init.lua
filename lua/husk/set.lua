vim.g.mapleader = " "

vim.opt.clipboard = { "unnamed", "unnamedplus" }

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
	desc = "highlight on yank",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = "200" })
	end,
})

autocmd("VimResized", {
    desc = "handle vim resizing",
    pattern = "*",
    command = "tabdo wincmd =",
})
