MAIN.configs["fterm"] = {
    setup = {
        border = "double",
        cmd = os.getenv("SHELL"),
        auto_close = true,
        hl = "Normal",
        blend = 0,
        dimensions = {height = 0.4, width = 1, x = 0, y = 0}
    },
    fterm_gitui = nil,
    toggle_gitui = function()
        local ok, fterm = pcall(require, "FTerm")
        if not ok then
            return
        end

        if MAIN.configs["fterm"].fterm_gitui == nil then
            MAIN.configs["fterm"].fterm_gitui =
                fterm:new(
                {
                    ft = "fterm_gitui",
                    cmd = "gitui",
                    dimensions = {
                        height = 0.9,
                        width = 0.9
                    }
                }
            )
        end
        MAIN.configs["fterm"].fterm_gitui:toggle()
    end
}

MAIN.keymappings.manage {
    {
        group = {
            ["<F7>"] = {"<cmd>lua require'FTerm'.toggle()<cr>", "Explorer"},
            ["<leader>"] = {
                ["g"] = {
                    "<cmd>lua MAIN.configs['fterm'].toggle_gitui()<cr>",
                    "Git UI"
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
