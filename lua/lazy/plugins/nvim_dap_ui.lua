return {{
   "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio"
    },
    opts = {
        layouts = {
            {
                elements = {
                    {
                        id = "scopes",
                        size = 0.65
                    },
                    --{
                    --    id = "breakpoints",
                    --    size = 0.25
                    --},
                    {
                        id = "stacks",
                        size = 0.35
                    },
                    --{
                    --    id = "watches",
                    --    size = 0.25
                    --}
                },
                position = "left",
                size = 60
            },
            {
                elements = {
                    --{
                    --    id = "repl",
                    --    size = 0.5
                    --},
                    {
                        id = "console",
                        size = 1
                    }
                },
                position = "bottom",
                size = 25
            }
        }
    }
}}
