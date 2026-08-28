return {{
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path"
	},
	opts = function()
		-- Register nvim-cmp lsp capabilities
		vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
		local cmp = require("cmp")
		local defaults = require("cmp.config.default")()
		local auto_select = true
		return {
			auto_brackets = {}, -- configure any file type to auto add brackets
			completion = {
				completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect")
			},
			preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-d>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-u>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				["<C-ESC>"] = cmp.mapping.abort(),
				["<Tab>"] = cmp.mapping.confirm()
			}),
			sources = cmp.config.sources(
				{
					{ name = "nvim_lsp" },
					{ name = "path" },
				},
				{
					{ name = "buffer" }
				}
			),
			sorting = {
				comparators = {
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used
				}
			}
		}
	end
}}
