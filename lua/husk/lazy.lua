local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    'navarasu/onedark.nvim',
    'tpope/vim-fugitive',
    'lewis6991/gitsigns.nvim',
    'github/copilot.vim',
    'j-hui/fidget.nvim',
    'numToStr/FTerm.nvim',
    'mrjones2014/nvim-ts-rainbow',
    'jay-babu/mason-nvim-dap.nvim',
    'folke/neodev.nvim',
    'kylechui/nvim-surround',
    'marko-cerovac/material.nvim',
    'sunjon/Shade.nvim',
    'RRethy/vim-illuminate',
    'simrat39/rust-tools.nvim',
    'mfussenegger/nvim-dap',

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    {
        'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'
    },

    {
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    },

    {
        'saecki/crates.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    {
        "folke/trouble.nvim",
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'mfussenegger/nvim-dap' }
    },
}

require("lazy").setup(plugins)
