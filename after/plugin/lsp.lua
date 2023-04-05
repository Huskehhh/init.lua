vim.diagnostic.config({
    virtual_text = true,
})

local coq = require('coq')
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event, bufnr)
    local opts = { buffer = bufnr, remap = false }
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
    coq.lsp_ensure_capabilities()
  end
})

vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format({ async = false }) end, opts)
vim.keymap.set("v", "<leader>fm", function() vim.lsp.buf.format({ async = false }) end, opts)

-- Language server setup
lspconfig.tsserver.setup({})

-- Rust specific setup
local rt = require("rust-tools")
require('crates').setup()

rt.setup({
    server = {
        settings = {
            ["rust-analyzer"] = {
                check = {
                    command = "clippy"
                }
            }
        },
    },
})
