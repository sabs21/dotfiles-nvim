vim.lsp.config['lua_ls'] = {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
}

local tsserver_filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' }
local vue_plugin = {
	name = '@vue/typescript-plugin',
	location = vim.fn.expand("$MASON/packages/vue-language-server") .. "/node_modules/@vue/language-server",
	languages = { "vue" }
}

vim.lsp.config['vtsls'] = {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin
				}
			}
		}
	}
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
