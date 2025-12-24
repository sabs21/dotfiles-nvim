return { {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "isort", "black" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			java = { "google-java-format" },
			rust = { "rustfmt" },
			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		}
	},
} }
