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
    config = function()
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            local opts = { noremap = true, silent = true, buffer = bufnr }
            require("remap").set_lspattach_mappings(opts)
        end
        local default_setup = function(server)
            require('lspconfig')[server].setup({
                capabilities = lsp_capabilities,
                on_attach = on_attach
            })
        end
        require("mason-lspconfig").setup_handlers({
            default_setup,
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
            ["java_language_server"] = function()
                require("lspconfig").java_language_server.setup {
                    filetypes = { "java" },
                    --cmd = { vim.fn.stdpath("data") .. "\\mason\\packages\\java-language-server\\dist\\lang_server_windows.sh" }
                    cmd = { "java-language-server.cmd" },
                    --root_dir = { vim.fn.stdpath("data") .. "/mason/packages/java-language-server" }
                }
            end,
            ["jdtls"] = function()
                require("lspconfig").jdtls.setup {
                    --cmd = { vim.fn.stdpath("data") .. "\\mason\\packages\\java-language-server\\dist\\lang_server_windows.sh" }
                    cmd = { "jdtls.cmd" },
                    --root_dir = { vim.fn.stdpath("data") .. "/mason/packages/java-language-server" }
                }
            end,

        })
        return {
            ensure_installed = { "lua_ls" }
        }
    end
} }
