MAIN.configs["lspinstaller"] = {
    settings = {
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
}
