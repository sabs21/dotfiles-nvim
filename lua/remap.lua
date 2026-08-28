-- Nvim mappings
vim.keymap.set("n", "^", vim.cmd.Ex)

-- Budge a line up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- deletes highlighted text into void, then pastes content
vim.keymap.set("x", "p", "\"_dP")

-- copy to the system clipboard
-- vim.keymap.set("n", "<leader>y", "\"+y")
-- vim.keymap.set("v", "<leader>y", "\"+y")
-- vim.keymap.set("n", "<leader>Y", "\"+y")

-- center and left align cursor while jumping half page steps
vim.keymap.set("n", "<C-d>", "<C-d>0zz")
vim.keymap.set("n", "<C-u>", "<C-u>0zz")

vim.keymap.set("n", "Q", "<nop>")

-- Use tab to indent highlighted items
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

-- global lsp mappings
-- vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
-- vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
-- vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')

--vim.keymap.set('n', '<leader>fm', '<cmd>lua require("conform").format()<cr>')
vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
-- vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
-- vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
-- vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
-- vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

vim.keymap.set('x', 'r',
	function()
		-- Save the visual selection to the unnamed register
		vim.cmd('normal! "zy')

		-- Store selected text in a variable
		local selection = vim.fn.getreg('z')

		-- Escape the selection
		local pattern = vim.fn.escape(selection, [[\]])
		pattern = pattern:gsub('\n', [[\n]])

		-- Put the pattern in the search register
		vim.fn.setreg('/', [[\V]] .. pattern)

		-- Prompt for the replacement text
		local replacement = vim.fn.input('Replace with: ')

		-- Replace all occurrences
		vim.cmd(string.format('%%s//%s/', vim.fn.escape(replacement, '/\\')))
	end,
	{ desc = 'Replace all occurrences of visual selection' }
)
