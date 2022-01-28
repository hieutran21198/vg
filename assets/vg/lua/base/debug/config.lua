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
                ["d"] = {
                    name = "Debug",
                    ["o"] = {"<cmd>lua require'dapui'.toggle()<cr>", "Toggle Debug UI"},
                    ["i"] = {":DIInstall ", "Install new debuggers"},
                    ["l"] = {"<cmd>DIList<cr>", "List installed debuggers"},
                    ["I"] = {":DIUninstall ", "Uninstall debuggers"}
                }
            }
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
