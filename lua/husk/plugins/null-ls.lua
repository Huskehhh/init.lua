local null_ls = require("null-ls")

local builtins = null_ls.builtins

local sources = {

	-- webdev stuff
	builtins.formatting.deno_fmt,
	builtins.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }),

	-- Lua
	builtins.formatting.stylua,

	-- cpp
	builtins.formatting.clang_format,

	-- rust
	builtins.formatting.rustfmt,
}

null_ls.setup({
	sources = sources,
})
