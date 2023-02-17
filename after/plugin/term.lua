local term = require("FTerm")
vim.keymap.set('n', '<leader>tm', function() term.toggle() end)
vim.keymap.set('t', '<leader>tm', function() term.toggle() end)
