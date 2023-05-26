local lsp = require('lsp-zero')
local luasnip = require('luasnip')
lsp.preset('recommended')

lsp.ensure_installed({
    'clangd',
    'ruff_lsp',
    'tsserver',
    'rust_analyzer',
    'cmake',
    'cssls',
    'dockerls',
    'docker_compose_language_service',
    'eslint',
    'html',
    'jsonls',
    'lua_ls',
    'marksman',
})

lsp.set_preferences({
    suggest_lsp_servers = false,
})

lsp.on_attach(function(_, bufnr)
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
end)

lsp.nvim_workspace()
lsp.setup()

local cmp = require("cmp")
local cmp_action = require('lsp-zero').cmp_action()

local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
})

cmp.setup({
    mapping = cmp_mappings,
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    formatting = {
        fields = { 'abbr', 'kind', 'menu' },
        format = require('lspkind').cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50,   -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
        })
    }
})

vim.diagnostic.config({
    virtual_text = true,
})

vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format({ async = false }) end)
vim.keymap.set("v", "<leader>fm", function() vim.lsp.buf.format({ async = false }) end)
