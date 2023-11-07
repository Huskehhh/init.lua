require("material").setup({
	plugins = {
		"dap",
		"gitsigns",
		"nvim-cmp",
		"nvim-tree",
		"nvim-web-devicons",
		"telescope",
		"trouble",
	},
})

require("material.functions").change_style("palenight")

vim.keymap.set("n", "<leader>th", function()
	require("material.functions").find_style()
end)
