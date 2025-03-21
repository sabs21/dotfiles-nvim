require("detectOS")

local os = require("os")
local work_dir = detectOS() == "win" and os.getenv("USERPROFILE") .. "\\projects" or os.getenv("HOME") .. "/dev"
--local work_dir = os.getenv("USERPROFILE") .. "\\AppData\\Local\\nvim"

-- set working directory when entering a file
local vim_enter_group = vim.api.nvim_create_augroup("vim_enter_group", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    command = "cd " .. work_dir,
    group = vim_enter_group
})
