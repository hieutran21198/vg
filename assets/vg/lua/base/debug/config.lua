MAIN.configs["debug.installer"] = {
    setup = {
        installation_path = MAIN.paths.app_config_dir .. "/dapinstall/"
    }
}

MAIN.configs["debug"] = {}

MAIN.configs["debugui"] = {
    setup = {
        {
            icons = {expanded = "▾", collapsed = "▸"},
            mappings = {
                expand = {"<CR>", "<2-LeftMouse>"},
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r"
            },
            sidebar = {
                elements = {
                    {
                        id = "scopes",
                        size = 0.25 -- Can be float or integer > 1
                    },
                    {id = "breakpoints", size = 0.25},
                    {id = "stacks", size = 0.25},
                    {id = "watches", size = 00.25}
                },
                size = 40,
                position = "left" -- Can be "left", "right", "top", "bottom"
            },
            tray = {
                elements = {"repl"},
                size = 10,
                position = "bottom" -- Can be "left", "right", "top", "bottom"
            },
            floating = {
                max_height = nil, -- These can be integers or a float between 0 and 1.
                max_width = nil, -- Floats will be treated as percentage of your screen.
                border = "single", -- Border style. Can be "single", "double" or "rounded"
                mappings = {
                    close = {"q", "<Esc>"}
                }
            },
            windows = {indent = 1}
        }
    }
}

MAIN.keymappings.set {
    {
        group = {
            ["<leader>"] = {
                ["D"] = {
                    name = "Debug",
                    ["i"] = {":DIInstall ", "Install new debuggers"},
                    ["l"] = {"<cmd>DIList<cr>", "List installed debuggers"},
                    ["I"] = {":DIUninstall ", "Uninstall debuggers"},
                    ["z"] = {"<cmd>lua require'dap'.run_last()<cr>", "Run last"},
                    ["r"] = {"<cmd>lua require'dap'.repl.open()<cr>", "Open repl"}
                },
                ["b"] = {"<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle debug breakpoints"},
                ["d"] = {"<cmd>lua require'dapui'.toggle()<cr>", "Toggle Debug UI"},
                ["B"] = {
                    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
                    "Debug breakpoint condition"
                }
            },
            ["g"] = {
                ["l"] = {
                    name = "Log",
                    ["p"] = {
                        "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>",
                        "Debug log point message"
                    }
                }
            },
            ["<F5>"] = {"<cmd>lua require'dap'.continue()<cr>", "Debug Continue"},
            ["<F10>"] = {"<cmd>lua require'dap'.step_over()<r>", "Debug step over"},
            ["<F11>"] = {"<cmd>lua require'dap'.step_into()<cr>", "Debug step into"},
            ["<F12>"] = {"<cmd>lua require'dap'.step_out()<cr>", "Debug step out"}
        },
        opts = {
            mode = "n",
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = true
        }
    }
}
