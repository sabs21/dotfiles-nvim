-- automatically switch directory when loading a file through netrw
-- vim.g["netrw_keepdir"] = 0
-- manually switch directory in netrw using 'cd'

vim.g.mapleader = " "

-- Reduce tab spacing
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Prevent text wrapping
vim.opt.wrap = false

-- Allow for a wider range of colors to display in neovim
vim.opt.termguicolors = true

-- Display line numbers
vim.wo.number = true

--vim.opt.nu = true
--vim.opt.relativenumber = true
--vim.opt.expandtab = true
--vim.opt.smartindent = true
--vim.opt.swapfile = false
--vim.opt.backup = false
--vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
--vim.opt.undofile = true
--vim.opt.hlsearch = false
--vim.opt.incsearch = true
--vim.opt.updatetime = 50
--vim.opt.scrolloff = 10
--vim.opt.winblend = 100
