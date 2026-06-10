vim.lsp.config['lua_ls'] = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
}

vim.lsp.config['vtsls'] = {
	init_options = {
		plugins = {
			{
				name = "@vue/typescript-plugin",
				location = vim.fn.expand("$MASON/packages/vue-language-server") .. "/node_modules/@vue/language-server",
				languages = { 'javascript', 'typescript', 'vue' }
			}
		}
	},
	filetypes = { 'javascript', 'typescript', 'vue' }
}

return { {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts =
			{
				PATH = "append",
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					}
				}
			}
		},
		"neovim/nvim-lspconfig",
	},
} }
