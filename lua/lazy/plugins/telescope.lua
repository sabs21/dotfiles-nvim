vim.g.git_status_delta = function()
	require("telescope.builtin").git_status({
		previewer = require("telescope.previewers").new_termopen_previewer({
			title = "Git Diff",
			get_command = function(entry)
				-- The contents of a new file isn't included in git diff
				-- unless we compare the file to an empty file (hence /dev/null)
				if entry.status == "??" then
					return {
						"git",
						"-c", "core.pager=delta",
						"-c", "delta.paging=never",
						"diff",
						"--no-index",
						"--text",
						"/dev/null",
						entry.path
					}
				end

				return {
					"git",
					"-c", "core.pager=delta",
					"-c", "delta.paging=never",
					"diff",
					"--",
					entry.value
				}
			end
		}),

		-- Due to an incompatibility between Telescope's scrolling action
		-- and Delta, the scrolling functionality for Telescope's preview
		-- window is re-implemented to manipulate the cursor directly.
		attach_mappings = function(prompt_bufnr, map)
			local function scroll_preview(direction)
				local preview = require("telescope.state")
					.get_status(prompt_bufnr)
					.layout
					.preview

				if not preview or not preview.winid then
					return
				end

				local height = vim.api.nvim_win_get_height(preview.winid)
				local amount = math.max(1, math.floor(height / 2))

				local cursor = vim.api.nvim_win_get_cursor(preview.winid)
				local cursorRowPos = cursor[1]
				local cursorColPos = cursor[2]

				local line_count = vim.api.nvim_buf_line_count(
					vim.api.nvim_win_get_buf(preview.winid)
				)
				local line = math.max(
					1,
					math.min(line_count, cursorRowPos + direction * amount)
				)

				vim.api.nvim_win_set_cursor(preview.winid, {
					line,
					cursorColPos
				})
			end

			map("n", "<C-d>", function()
				scroll_preview(1)
			end)

			map("n", "<C-u>", function()
				scroll_preview(-1)
			end)

			return true
		end
	})
end

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
		{ "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>", desc = "Show Definitions" },
		{ "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", desc = "Show Implementations" },
		{ "gr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>", desc = "Show References" },
		{ "gD", "<cmd>lua vim.g.git_status_delta()<cr>", desc = "Show Git Diff" }
	},
	opts =
	{
		defaults =
		{
			winblend = 30,
			layout_strategy = 'vertical',
			layout_config = {
				height = 0.96,
				width = 0.98,
				preview_height = 0.7
			},
			initial_mode = "normal"
		},
		pickers = {
			live_grep = {
				initial_mode = "insert"
			}
		}
	}
} }
