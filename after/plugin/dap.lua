local dap = require('dap')
local dapui = require('dapui')
local mason_nvim_dap = require('mason-nvim-dap')
mason_nvim_dap.setup({
    automatic_setup = true,
})

mason_nvim_dap.setup_handlers {}

dapui.setup()

vim.keymap.set("n", "<leader>db", function() dapui.toggle() end)
vim.keymap.set("n", "<leader>bp", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<leader>dc", function() dap.continue() end)
vim.keymap.set("n", "<leader>ds", function() dap.step_over() end)
vim.keymap.set("n", "<leader>dS", function() dap.step_into() end)
