return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    -- Everything in opts will be passed to setup()
    keys = {
        {
            "<leader>fm",
            function()
                require("conform").format(
                    { async = true, lsp_fallback = true },
                    function()
                        vim.cmd("e!")
                    end
                )
            end,
        }
    },
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            javascript = { { "prettierd", "prettier" } },
            java = { "google-java-format" },
            rust = { "rustfmt" }
        },
        -- Set up format-on-save
        --format_after_save = { lsp_fallback = true },
        -- Customize formatters
        formatters = {
            rustfmt = {
                command = "rustfmt",
                args = {
                    "--edition",
                    "2024",
                    "--config",
                    "max_width=80",
                    "$FILENAME"
                }
            },
        },
    },
}
