require "predefine.telescope.config"

MAIN.plugin_manager.store {
    ["nvim-telescope/telescope.nvim"] = {
        requires = {"nvim-lua/plenary.nvim"},
        config = function()
            local ok, telescope = pcall(require, "telescope")
            if not ok then return end
            local conf = MAIN.configs["telescope"]
            conf.setup = vim.tbl_deep_extend("force", conf.setup,
                                             conf.lazy_setup())
            telescope.setup(conf.setup)
            MAIN.keymappings.set(conf.keymappings)
        end
    }
}
