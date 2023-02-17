vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<C-h>", function () vim.cmd.wincmd({ args = { "h" } }) end)
vim.keymap.set("n", "<C-j>", function () vim.cmd.wincmd({ args = { "j" } }) end)
vim.keymap.set("n", "<C-k>", function () vim.cmd.wincmd({ args = { "k" } }) end)
vim.keymap.set("n", "<C-l>", function () vim.cmd.wincmd({ args = { "l" } }) end)
