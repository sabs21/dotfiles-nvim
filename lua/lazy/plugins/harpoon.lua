return {{
	--dir = "C:\\Users\\Nick\\AppData\\Local\\projects\\harpoon",
	"ThePrimeagen/harpoon",
	--dev = true,
	branch = "harpoon2",
	dependencies = 
	{
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim"
	},
	config = function ()
		local harpoon = require("harpoon")
		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
		vim.keymap.set(
			"n", 
			"<leader>hp", 
			function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
			{ desc = "Open harpoon window" }
		)

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
		vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
	end
}}
