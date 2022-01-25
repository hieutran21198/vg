require "base.lspinstaller.config"

MAIN.plugin_manager.store {
    ["williamboman/nvim-lsp-installer"] = {
        config = function()
            local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
            if not ok then return end
            local conf = MAIN.configs["lspinstaller"]
            lsp_installer.settings(conf.settings)
            lsp_installer.on_server_ready(function(server)
                local opts = {}
                local lspconf = MAIN.configs["lspconfig"]
                for _, custom_opts_fn in ipairs(lspconf.custom_options) do
                    opts = custom_opts_fn(opts, server.name)
                end
                server:setup(opts)
            end)
        end
    }
}
