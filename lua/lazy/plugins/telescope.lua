return { {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies =
    {
        "nvim-lua/plenary.nvim",
        "sharkdp/fd",
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-fzy-native.nvim"
    },
    keys =
    {
        { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>", desc = "Find files" },
        { "<leader>fg", "<cmd>lua require('telescope.builtin').git_files()<cr>",  desc = "Git files" },
        { "<leader>fl", "<cmd>lua require('telescope.builtin').live_grep()<cr>",  desc = "Live grep" },
    },
    config = {
        layout_config = {
            width = 0.75,
            preview_cutoff = 120,
            horizontal = { mirror = false },
            vertical = { mirror = false },
        },
    }
} }
