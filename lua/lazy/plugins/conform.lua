return { {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			vue = { "prettierd" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			csharp = { "csharpier" },
			["_"] = { "trim_whitespace" }
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 3000,
		}
	},
} }
