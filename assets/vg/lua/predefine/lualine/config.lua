local utils = require "utils"

utils.require_dep(
    "lualine",
    function()
        MAIN.settings["lualine"] = {
            setup = {
                options = {
                    icons_enabled = true,
                    theme = "auto",
                    component_separators = {left = "", right = ""},
                    section_separators = {left = "", right = ""},
                    disabled_filetypes = {},
                    always_divide_middle = true
                },
                sections = {
                    lualine_a = {"mode"},
                    lualine_b = {"branch", "diff", "diagnostics"},
                    lualine_c = {"filename"},
                    lualine_x = {"encoding", "fileformat", "filetype"},
                    lualine_y = {"progress"},
                    lualine_z = {"location"}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {"filename"},
                    lualine_x = {"location"},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {}
            }
        }
    end
)

MAIN.configs["lualine"] = function()
    local ok, lualine = pcall(require, "lualine")
    if not ok then
        return
    end
    local settings = MAIN.settings["lualine"]
    lualine.setup(settings.setup)
end
