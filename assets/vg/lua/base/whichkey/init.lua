require "base.whichkey.config"

MAIN.plugin_manager.store {
    ["folke/which-key.nvim"] = {
        config = function()
            local conf = MAIN.configs["keymappings"]
            local ok, wk = pcall(require, "which-key")
            if not ok then
                return
            end
            wk.setup(conf.setup)
        end
    }
}
