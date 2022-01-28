require "base.debug.config"

MAIN.plugin_manager.store {
    ["rcarriga/nvim-dap-ui"] = {
        config = function()
            local conf = MAIN.configs["debugui"]
            local ok, dapui = pcall(require, "dapui")
            if not ok then
                return
            end
            dapui.setup(conf.setup)
        end,
        requires = {"mfussenegger/nvim-dap"}
    },
    ["mfussenegger/nvim-dap"] = {
        config = function()
            local ok, dap = pcall(require, "dap")
            if not ok then
                return
            end
            local ok_dapui, dapui = pcall(require, "dapui")
            if ok_dapui then
                dap.listeners.after.event_initialized["dapui_config"] = function()
                    dapui.open()
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                    dapui.close()
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                    dapui.close()
                end
            end
        end
    },
    ["Pocco81/DAPInstall.nvim"] = {
        config = function()
            local ok, installer = pcall(require, "dap-install")
            if not ok then
                return
            end

            local conf = MAIN.configs["debug.installer"]
            installer.setup(conf.setup)
            local base_dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()
            local dbg_list = {}
            for _, v in pairs(base_dbg_list) do
                dbg_list[v] = nil
            end

            local debuggers = MAIN.debuggers()
            for k, v in pairs(debuggers) do
                dbg_list[k] = v
            end
            for k, v in pairs(dbg_list) do
                installer.config(k, v)
            end
        end,
        requires = {"mfussenegger/nvim-dap"}
    }
}
