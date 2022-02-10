local utils = require "utils"

utils.require_dep(
    "FTerm",
    function()
        MAIN.settings["FTerm"] = {
            setup = {
                border = "double",
                cmd = os.getenv("SHELL"),
                auto_close = true,
                hl = "Normal",
                blend = 0,
                dimensions = {height = 0.4, width = 1, x = 0, y = 0}
            },
            keymappings = {
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
            },
            fterm_gitui = nil,
            toggle_gitui = function()
                local ok, fterm = pcall(require, "FTerm")
                if not ok then
                    return
                end

                if MAIN.settings["FTerm"].fterm_gitui == nil then
                    MAIN.settings["FTerm"].fterm_gitui =
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
                MAIN.settings["FTerm"].fterm_gitui:toggle()
            end
        }
    end
)

MAIN.configs["FTerm"] = function()
    local ok, fterm = pcall(require, "FTerm")
    if not ok then
        return
    end
    local settings = MAIN.settings["FTerm"]
    fterm.setup(settings.setup)
    MAIN.keymappings.set(settings.keymappings)
end
