MAIN.configs["fterm"] = {
    setup = {
        border = "double",
        cmd = os.getenv("SHELL"),
        auto_close = true,
        hl = "Normal",
        blend = 0,
        dimensions = {height = 0.4, width = 1, x = 0, y = 0}
    }
}

MAIN.keymappings.manage {
    {
        group = {
            ["<F7>"] = {"<cmd>lua require'FTerm'.toggle()<cr>", "Explorer"}
        },
        opts = {
            mode = "n",
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = true
        }
    },
    {
        group = {
            ["<F7>"] = {"<cmd>lua require'FTerm'.toggle()<cr>", "Explorer"}
        },
        opts = {
            mode = "t",
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = true
        }
    }
}
