local lsp = require('lsp-zero')
local luasnip = require('luasnip')
lsp.preset('recommended')

lsp.ensure_installed({
    'clangd',
    'ruff_lsp',
    'tsserver',
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            local copilot_keys = vim.fn['copilot#Accept']()
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif copilot_keys ~= '' and type(copilot_keys) == 'string' then
                vim.api.nvim_feedkeys(copilot_keys, 'i', true)
            else
                fallback()
            end
        end, {
            'i',
            's',
        }),
    })

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
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
    vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format({ async = false }) end, opts)
end)

lsp.nvim_workspace()
lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})
