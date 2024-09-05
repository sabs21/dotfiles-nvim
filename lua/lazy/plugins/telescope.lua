return { {
    "nvim-telescope/telescope.nvim",
    dependencies =
    {
        "nvim-lua/plenary.nvim",
        "sharkdp/fd",
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-fzy-native.nvim"
    },
    keys =
    {
        { "?", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", desc = "Find Local" },
        { "<leader>?", "<cmd>lua require('telescope.builtin').live_grep()<cr>", desc = "Find All" },
    },
    opts = {
		defaults = {
			winblend = 30
		}
	}
} }
