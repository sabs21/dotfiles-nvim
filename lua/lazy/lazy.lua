local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
        "--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

local opts =
{
    spec = { import = "lazy.plugins" },
    install = { colorscheme = { "melange" } },
    checker = { enabled = true }
}
require("lazy").setup('lazy.plugins', opts)
