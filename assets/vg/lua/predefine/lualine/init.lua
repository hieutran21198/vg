require "predefine.lualine.config"
MAIN.plugin_manager.store {
    ["nvim-lualine/lualine.nvim"] = {
        requires = {"kyazdani42/nvim-web-devicons", opt = true},
        config = MAIN.configs["lualine"]
    }
}
