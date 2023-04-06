vim.g.coq_settings = {
  auto_start = "shut-up",
  keymap = {
    eval_snips = "<leader>sn",
  },
}

vim.diagnostic.config({
    virtual_text = true,
})

local lspconfig = require('lspconfig')

local lsp_servers = {
    tsserver = {},
    clangd = {},
    cmake = {},
    jsonls = {},
    rust_analyzer = {
        check = {
            command = "clippy"
        }
    },
    html = {},
    lua_ls = {},
    marksman = {},
    ruff_lsp = {},
    yamlls = {},
}

local null_servers = {
    "prettierd",
    "rustfmt",
    "black",
    "isort",
    "stylua",
    "jq",
}

require('mason').setup()
require("mason-null-ls").setup({
    ensure_installed = null_servers,
    automatic_installation = true,
    automatic_setup = true,
})

require("mason-lspconfig").setup({
    ensure_installed = lsp_servers,
    automatic_installation = true,
})

require("null-ls").setup()
require("mason-null-ls").setup_handlers()

local server_maps = function(opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>a", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gR", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<leader>sh", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format({ async = false }) end, opts)
    vim.keymap.set("v", "<leader>fm", function() vim.lsp.buf.format({ async = false }) end, opts)
end


local coq = require('coq')
for lsp, settings in pairs(lsp_servers) do
    lspconfig[lsp].setup(coq.lsp_ensure_capabilities({
        on_attach = function(_, buffer)
            server_maps({ buffer = buffer })
        end,
        settings = settings,
    }))
end

require('crates').setup()
