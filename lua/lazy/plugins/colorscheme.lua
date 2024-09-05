return {{
	"savq/melange-nvim",
	lazy = false,
	priority = 1000,
	config = function() 
		vim.cmd("colorscheme melange")
        -- command line background color
        vim.cmd.highlight('MsgArea guibg=#383431')
	end
}}

