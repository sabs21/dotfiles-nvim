return { {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			["cpp"] = { "clang_format" },
			["cs"] = { "csharpier" },
			["js"] = { "prettierd" },
			["vue"] = { "prettierd" },
			["_"] = { "trim_whitespace" }
		},
		format_on_save = {
			lsp_format = "fallback",
			timeout_ms = 500,
		}
	},
} }
