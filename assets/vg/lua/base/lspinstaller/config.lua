local utils = require "utils"

utils.require_dep(
    "nvim-lsp-installer",
    function()
        MAIN.settings["nvim-lsp-installer"] = {
            ui = {
                icons = {
                    server_installed = "◍",
                    server_pending = "◍",
                    server_uninstalled = "◍"
                },
                keymaps = {
                    toggle_server_expand = "<CR>",
                    install_server = "i",
                    update_server = "u",
                    uninstall_server = "X"
                }
            },
            install_root_dir = MAIN.paths.app_config_dir .. "/lsp_servers",
            pip = {install_args = {}},
            max_concurrent_installers = 4
        }
    end
)

MAIN.configs["nvim-lsp-installer"] = function()
    local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
    if not ok then
        return
    end
    local settings = MAIN.settings["nvim-lsp-installer"]
    lsp_installer.settings(settings)
    lsp_installer.on_server_ready(
        function(server)
            local opts = {}
            local lspconf = MAIN.settings["lspconfig"]
            for _, custom_opts_fn in ipairs(lspconf.custom_options) do
                opts = custom_opts_fn(opts, server.name)
            end
            server:setup(opts)
        end
    )
end
