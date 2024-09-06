return {{
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui"
    },
    keys =
    {
        {
            "<F7>",
            "<cmd>lua require('dap').toggle_breakpoint()<cr>",
            desc = "Debugger: Toggle breakpoint"
        },
        {
            "<F8>",
            "<cmd>lua require('dap').terminate()<cr>",
            desc = "Debugger: Terminate"
        },
        {
            "<F9>",
            "<cmd>lua require('dap').continue()<cr>",
            desc = "Debugger: Continue"
        },
        {
            "<F10>",
            "<cmd>lua require('dap').step_over()<cr>",
            desc = "Debugger: Step over"
        },
        {
            "<F11>",
            "<cmd>lua require('dap').step_into()<cr>",
            desc = "Debugger: Step into"
        },
        {
            "<F12>",
            "<cmd>lua require('dap').step_out()<cr>",
            desc = "Debugger: Step out"
        },
    },
    -- nvim-dap does not have a setup function which is why a config function is required
    config = function()
        -- automatically opens/closes the debugger
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        local codelldb_path = require("mason-registry").get_package("codelldb"):get_install_path() .. "\\extension\\adapter\\codelldb.exe"
        dap.adapters.codelldb = {
            type = 'server',
            --host = '127.0.0.1',
            port = "${port}",
            executable = {
                command = codelldb_path,
                args = { "--port", "${port}" }
            }
        }
        dap.configurations.rust = {
            {
                name = "Debug",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '\\target\\debug\\', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopOnEntry = false,
                showDisassembly = "never",
            },
            --{
            --    name = "Attach",
            --    type = "codelldb",
            --    mode = "local",
            --    request = "attach",
            --    processId = require("dap.utils").pick_process,
            --    stopOnEntry = false,
            --    showDisassembly = "never",
            --}
        }
    end
}}
