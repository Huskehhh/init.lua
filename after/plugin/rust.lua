local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { remap = true })
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { remap = true })
            vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format({ async = false }) end, opts)
        end,
    },
})

rt.inlay_hints.set()
rt.inlay_hints.enable()
