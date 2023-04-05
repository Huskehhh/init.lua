-- require('onedark').load()
local material = require('material')

material.setup({
    plugins = {
        "dap",
        "gitsigns",
        "indent-blankline",
        "nvim-cmp",
        "nvim-tree",
        "nvim-web-devicons",
        "telescope",
        "trouble",
    },
})

require('material.functions').change_style('darker')
