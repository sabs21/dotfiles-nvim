return { {
    -- automatically manage LSPs
    "williamboman/mason-lspconfig.nvim",
    cmd = {
        "LspInfo",
        "LspInstall",
        "LspStart"
    },
    event = {
        "BufReadPre",
        "BufNewFile"
    },
    dependencies = {
        { "neovim/nvim-lspconfig" },
        { "hrsh7th/cmp-nvim-lsp" },
        { "williamboman/mason.nvim" }
    },
    opts = {
        handlers = {
            function (server_name) -- default handler
                local capabilities = vim.tbl_deep_extend("force",
                    vim.lsp.protocol.make_client_capabilities(),
                    require("cmp_nvim_lsp").default_capabilities()
                )
                require("lspconfig")[server_name].setup {
                    capabilities = capabilities
                }
            end,
            ["lua_ls"] = function()
                require("lspconfig").lua_ls.setup {
                    settings = {
                        Lua = {
                            runtime = {
                                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                                version = "LuaJIT",
                                path = vim.split(package.path, ";"),
                            },
                            diagnostics = {
                                -- Get the language server to recognize the `vim` global
                                globals = { "vim" },
                            },
                            workspace = {
                                -- Make the server aware of Neovim runtime files and plugins
                                library = { vim.env.VIMRUNTIME },
                                checkThirdParty = false,
                            },
                            telemetry = {
                                enable = false,
                            },
                        }
                    }
                }
            end,
        },
        ensure_installed = { "lua_ls" }
    }
} }
