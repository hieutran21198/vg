MAIN.keymappings.manage {
    {
        group = {
            ["<leader>"] = {
                ["g"] = {
                    name = "Git",
                    ["b"] = {"<cmd>Git blame<cr>", "Git blame"},
                    ["s"] = {"<cmd>Git status<cr>", "Git status"}
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
