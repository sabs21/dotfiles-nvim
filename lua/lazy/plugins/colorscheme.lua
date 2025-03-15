return {{
	"savq/melange-nvim",
	lazy = false,
	priority = 1000,
	config = function() 
		vim.cmd("colorscheme melange")
        -- opaque background
        --vim.cmd.highlight('MsgArea guibg=#383431')
        -- transparent background
        vim.cmd.highlight('Normal guibg=NONE ctermbg=NONE')
        vim.cmd.highlight('LineNr guibg=NONE ctermbg=NONE')
        vim.cmd.highlight('SignColumn guibg=NONE ctermbg=NONE')
        vim.cmd.highlight('EndOfBuffer guibg=NONE ctermbg=NONE')
	end
}}

