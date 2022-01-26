require "predefine.nvimtree.config"

MAIN.plugin_manager.store {
    ["kyazdani42/nvim-tree.lua"] = {
        requires = {"kyazdani42/nvim-web-devicons"},
        config = function()
            local ok, nvim_tree = pcall(require, "nvim-tree")
            if not ok then
                return
            end
            local conf = MAIN.configs["nvimtree"]
            local setup = conf.setup
            MAIN.g.set(conf.g)
            for _, custom_setup_fn in ipairs(conf.lazy_setup) do
                setup = custom_setup_fn(setup)
            end
            nvim_tree.setup(setup)
        end
    }
}
