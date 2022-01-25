require "predefine.autopairs.config"

MAIN.plugin_manager.store {
    ["windwp/nvim-autopairs"] = {
        config = function()
            local ok, autopairs = pcall(require, "nvim-autopairs")
            if not ok then
                return
            end
            local conf = MAIN.configs["autopairs"]
            autopairs.setup(conf.setup)
        end
    }
}
