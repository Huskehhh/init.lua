local null_ls = require("null-ls")

local builtins = null_ls.builtins

local sources = {
	builtins.formatting.stylua,
	builtins.formatting.clang_format,
	builtins.formatting.rustfmt,
}

null_ls.setup({
	sources = sources,
})
