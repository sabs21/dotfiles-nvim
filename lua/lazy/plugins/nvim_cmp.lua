return {{
	"hrsh7th/nvim-cmp",
	event = {
		"InsertEnter",
		"CmdlineEnter"
	},
	dependencies = {
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "hrsh7th/cmp-buffer"},
		{ "hrsh7th/cmp-path"},
		{ "hrsh7th/cmp-cmdline" },
	},
	config = function()
		local cmp = require('cmp')
		local luasnip = require('luasnip')
		local has_words_before = function()
		    unpack = unpack or table.unpack
		    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end
		print("running cmp setup")
		cmp.setup({
			sources = {
				{name = 'nvim_lsp'},
				--{name = 'nvim_lua'},
				{name = 'luasnip'},
				{name = 'buffer'},
				{name = 'path'},
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<Tab>"] = cmp.mapping(function(fallback)
				  if cmp.visible() then
					cmp.select_next_item()
				  -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
				  -- that way you will only jump inside the snippet region
				  elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				  elseif has_words_before() then
					cmp.complete()
				  else
					fallback()
				  end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
				  if cmp.visible() then
					cmp.select_prev_item()
				  elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
				  else
					fallback()
				  end
				end, { "i", "s" }),
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end
			}
		})
		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' }
			}
		})
		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources(
				{
					{ name = 'path' }
				},
				{
					{ name = 'cmdline' }
				}
			)
		})
	end
}}
