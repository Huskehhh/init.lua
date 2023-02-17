vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-h>", vim.cmd.wincmd({ args = { "h" } }))
vim.keymap.set("n", "<C-j>", vim.cmd.wincmd({ args = { "j" } }))
vim.keymap.set("n", "<C-k>", vim.cmd.wincmd({ args = { "k" } }))
vim.keymap.set("n", "<C-l>", vim.cmd.wincmd({ args = { "l" } }))
