require "base.debug.config"

MAIN.plugin_manager.store {
    ["rcarriga/nvim-dap-ui"] = {
        config = MAIN.configs["debugui"],
        requires = {"mfussenegger/nvim-dap"}
    },
    ["mfussenegger/nvim-dap"] = {
        config = MAIN.configs["dap"]
    },
    ["Pocco81/DAPInstall.nvim"] = {
        config = MAIN.configs["debug.installer"],
        requires = {"mfussenegger/nvim-dap"}
    }
}
