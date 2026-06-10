return { {
	"nvim-telescope/telescope.nvim",
	tag = 'v0.2.1',
	dependencies =
	{
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope-fzy-native.nvim"
	},
	extensions =
	{
		"nvim-telescope/telescope-fzy-native.nvim"
	},
	keys =
	{
		{ "?", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Find All" },
	},
	opts =
	{
		defaults =
		{
			winblend = 30
		}
	}
} }
