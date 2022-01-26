require "predefine.lualine.config"
MAIN.plugin_manager.store {
    ["nvim-lualine/lualine.nvim"] = {
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = function()
            local ok, lualine = pcall(require, "lualine")
            if not ok then
                return
            end
            local conf = MAIN.configs["lualine"]
            lualine.setup(conf.setup)
        end
    }
}
