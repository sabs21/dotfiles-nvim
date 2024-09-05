return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>fm",
            function()
                require("conform").format({
                    async = false,
                    lsp_fallback = true,
                    timeout_ms = 500
                })
            end,
        }
    },
    -- Everything in opts will be passed to setup()
    opts = {
        -- Define your formatters
        formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            html = { "prettierd" },
            javascript = { "prettierd" },
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
