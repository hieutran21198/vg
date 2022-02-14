MAIN = {
    paths = {
        app_runtime_dir = "",
        appname = "",
        app_config_dir = ""
    },
    plugin_manager = require "main.plugin_manager",
    configs = {},
    settings = {},
    g = require "main.g",
    options = require "main.option",
    autocmds = require "main.autocmd",
    keymappings = require "main.keymapping",
    linters = require "main.linter",
    formatters = require "main.formatter".formatters,
    format_on_save = require "main.formatter".format_on_save,
    debuggers = require "main.debugger".debuggers,
    colorscheme = nil,
    set_colorscheme = function(colorscheme)
        MAIN.colorscheme = colorscheme
        local json = require "json"
        local f = io.open(MAIN.paths.app_config_dir .. "/colorscheme.json", "w+")
        f:write(json.encode {colorscheme = colorscheme})
        f:close()
    end,
    get_colorscheme = function()
        local json = require "json"
        local f = io.open(MAIN.paths.app_config_dir .. "/colorscheme.json", "r")
        local obj = json.decode(f:read("*a"))
        MAIN.colorscheme = obj.colorscheme
        local bg = obj["background"]
        if bg ~= nil then
            if bg ~= "auto" then
                MAIN.options.manage {
                    background = bg
                }
            else
                local hour = os.date("*t").hour
                bg = "light"
                if hour > 18 then
                    bg = "dark"
                end
                print("'" .. bg .. "' theme applied")
                MAIN.options.manage {
                    background = bg
                }
            end
        end
        if obj["transparent"] ~= nil then
            MAIN.options.manage {
                transparent = obj["transparent"]
            }
        end
    end
}

MAIN.reload = function()
    local prefix_dirs = {"^main", "^utils", "^predefine", "^base"}
    for name, _ in pairs(package.loaded) do
        for _, dir in ipairs(prefix_dirs) do
            if name:match(dir) then
                package.loaded[name] = nil
            end
        end
    end
    dofile(MAIN.paths.app_config_dir .. "/config.lua")
    dofile(MAIN.paths.app_runtime_dir .. "/init.lua")
    if vim.fn.delete(MAIN.paths.app_runtime_dir .. "/plugin/packer_compiled.lua") ~= 0 then
        print("cannot delete cached compile plugins")
    end
    require "packer".compile()
end

MAIN.bootstrap = function(params)
    local paths = params.paths
    MAIN.paths = paths or MAIN.paths
    require "base"
    -- load user config
    local utils = require "utils"
    local user_config_filepath = vim.env.HOME .. "/.config/" .. MAIN.paths.appname .. "/config.lua"
    if utils.file_exists(user_config_filepath) then
        utils.load_file(user_config_filepath)
    else
        print("no user config file found. Use the default config.")
    end
    MAIN.plugin_manager.setup(MAIN.paths.app_runtime_dir)

    MAIN.plugin_manager.compile()

    MAIN.get_colorscheme()
    MAIN.options.compile()
    MAIN.g.compile()
    MAIN.keymappings.compile()
    MAIN.autocmds.compile()
    -- pcall(MAIN.get_colorscheme)
    if MAIN.colorscheme ~= nil and MAIN.colorscheme ~= "" then
        vim.cmd("colorscheme " .. MAIN.colorscheme)
    end
end
