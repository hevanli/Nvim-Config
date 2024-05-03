local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "nvim-lua/plenary.nvim" },
	{
		"nvim-telescope/telescope.nvim", 
		tag = '0.1.3',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
    {
        "Mofiqul/dracula.nvim",
        priority = 1000,

    },
    {
        "olimorris/onedarkpro.nvim",
        priority = 999 -- Ensure it loads first
    },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = false,
		priority = 998,
	},
	{
		"nvim-treesitter/nvim-treesitter", 
		config = function()
			vim.cmd([[:TSUpdate]])
		end,
	},
	{ "nvim-treesitter/playground" },
	-- { "theprimeagen/harpoon" },
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
    -- LSP Stuff
  	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'hrsh7th/cmp-nvim-lsp' },
    },
    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'L3MON4D3/LuaSnip' }
    },
    -- Auto pair
    { "jiangmiao/auto-pairs" },
})

