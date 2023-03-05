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
    'wbthomason/packer.nvim',
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        dependencies = {
            'nvim-lua/plenary.nvim'
        },
    },
    {
        'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'
    },
    'nvim-treesitter/nvim-treesitter-context',
    'ThePrimeagen/harpoon',
    'mbbill/undotree',
    'navarasu/onedark.nvim',
    'tpope/vim-fugitive',
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
    'simrat39/rust-tools.nvim',
    'mfussenegger/nvim-dap',
    {
        'saecki/crates.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    'lewis6991/gitsigns.nvim',
    'github/copilot.vim',
    'j-hui/fidget.nvim',
    'numToStr/FTerm.nvim',
    'mrjones2014/nvim-ts-rainbow',
    {
        "folke/trouble.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
    },
}

require("lazy").setup(plugins)
