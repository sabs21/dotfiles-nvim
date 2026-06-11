return{{
	"lewis6991/hover.nvim",
	keys = {
		{ "K", function() require("hover").hover() end, desc = "hover.nvim" }
	},
	opts = {
		providers = {
			"hover.providers.lsp",
			"hover.providers.diagnostic"
		},
		preview_opts = {
			border = "single"
		},
		preview_window = false,
		title = true
	}
}}
