MAIN.configs["lspconfig"] = {
    custom_options = {
        function(opts, name)
            if name == "sumneko_lua" then
                local custom_opt = {
                    settings = {Lua = {workspace = {preloadFileSize = 500}}}
                }
                return vim.tbl_deep_extend("force", opts, custom_opt)
            end
            return opts
        end,
        function(opts, _)
            MAIN.configs["lspconfig"].set_on_attach(
                opts,
                function(_, bufnr)
                    MAIN.keymappings.set {
                        {
                            group = {
                                ["K"] = {"<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover"},
                                ["g"] = {
                                    ["r"] = {"<cmd>lua vim.lsp.buf.references()<CR>", "References"},
                                    ["d"] = {"<cmd>lua vim.lsp.buf.definition()<cr>", "Definitions"},
                                    ["D"] = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "Declarations"},
                                    ["I"] = {"<cmd>lua vim.lsp.buf.Implementation()<cr>", "Implementations"},
                                    ["a"] = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Actions"}
                                },
                                ["["] = {
                                    ["g"] = {"<cmd>lua vim.diagnostic.goto_prev()<CR>", "LSP goto previous mark"}
                                },
                                ["]"] = {
                                    ["g"] = {"<cmd>lua vim.diagnostic.goto_next()<CR>", "LSP goto previous mark"}
                                },
                                ["<leader>"] = {
                                    ["l"] = {
                                        name = "LSP",
                                        ["a"] = {"<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Actions"},
                                        ["d"] = {"<cmd>lua vim.diagnostic.open_float()<cr>", "Diagnostics"},
                                        ["f"] = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "Format buffer"}
                                    }
                                },
                                ["<F2>"] = {"<cmd>lua vim.lsp.buf.rename()<cr>", "Rename"}
                            },
                            opts = {
                                mode = "n",
                                buffer = bufnr,
                                silent = true,
                                noremap = true,
                                nowait = true
                            }
                        }
                    }
                end
            )
            return opts
        end
    },
    set_custom_options = function(opt_fns)
        for _, opt_fn in ipairs(opt_fns) do
            table.insert(MAIN.configs["lspconfig"].custom_options, opt_fn)
        end
    end,
    set_on_attach = function(opts, on_attach)
        local def_on_attach = opts.on_attach
        opts.on_attach = function(client, bufnr)
            if def_on_attach ~= nil and type(def_on_attach) == "function" then
                def_on_attach(client, bufnr)
            end
            if on_attach ~= nil and type(on_attach) == "function" then
                on_attach(client, bufnr)
            end
        end
    end
}

MAIN.keymappings.set {
    {
        group = {
            ["<leader>"] = {
                ["L"] = {
                    name = "LSP Installer",
                    ["I"] = {"<cmd>LspInfo<cr>", "LSP Information"},
                    ["r"] = {"<cmd>LspRestart<cr>", "LSP restart"},
                    ["i"] = {":LspInstall ", "LSP install {...protocols}"},
                    ["l"] = {"<cmd>LspPrintInstalled<cr>", "LSP list installed protocols"},
                    ["x"] = {"<cmd>LspStop<cr>", "LSP stop"},
                    ["u"] = {":LspUninstall ", "LSP uninstall {...protocols}"}
                },
                ["z"] = {"<cmd>LspRestart<cr>", "LSP restart"}
            }
        },
        otps = {
            mode = "n",
            buffer = nil,
            silent = true,
            noremap = true,
            nowait = true
        }
    }
}
