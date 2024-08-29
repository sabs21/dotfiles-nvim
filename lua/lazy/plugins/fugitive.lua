return { {
    "tpope/vim-fugitive",
    keys =
    {
        {
            "<leader>gg",
            "<cmd>lua vim.cmd.Git()<cr>",
            desc = "Git"
        },
        {
            "<leader>gs",
            "<cmd>lua vim.cmd.Git('add .')<cr>",
            desc = "Git stage all"
        },
        {
            "<leader>gS",
            "<cmd>lua vim.cmd.Git('reset')<cr>",
            desc = "Git unstage all"
        },
        {
            "<leader>gp",
            "<cmd>lua vim.cmd.Git('pull')<cr>",
            desc = "Git pull"
        },
        {
            "<leader>gP",
            "<cmd>lua vim.cmd.Git('push')<cr>",
            desc = "Git push"
        },
        {
            "<leader>gx",
            "<cmd>lua vim.cmd.Git('stash')<cr>",
            desc = "Git stash"
        },
        {
            "<leader>gX",
            "<cmd>lua vim.cmd.Git('reset --hard')<cr>",
            desc = "Git hard reset"
        },
        {
            "<leader>gc",
            "<cmd>lua vim.cmd.Git('commit')<cr>",
            desc = "Git commit"
        },
        {
            "<leader>gD",
            "<cmd>" ..
            "lua vim.cmd('split');" ..
            "local win = vim.api.nvim_get_current_win();" ..
            "local buf = vim.api.nvim_create_buf(true, true);" ..
            "vim.api.nvim_win_set_buf(win, buf);" ..
            "vim.fn.termopen('git -P diff | delta -n -s --dark', { cwd = vim.loop.cwd() })" ..
            "<cr>",
            desc = "Git diff"
        }
    }
} }
