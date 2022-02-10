require "predefine.telescope.config"

MAIN.plugin_manager.store {
    ["nvim-telescope/telescope.nvim"] = {
        requires = {"nvim-lua/plenary.nvim"},
        config = MAIN.configs["telescope"]
    },
    ["nvim-telescope/telescope-file-browser.nvim"] = {
        config = MAIN.configs["telescopeext.file_browser"]
    }
}
