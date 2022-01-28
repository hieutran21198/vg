require "predefine.gs"
require "predefine.options"
require "predefine.autocmds"
require "predefine.telescope"
require "predefine.nvimtree"
require "predefine.keymappings"
require "predefine.completion"
require "predefine.comment"
require "predefine.terminal"
require "predefine.autopairs"
require "predefine.lualine"
require "predefine.sneak"

require "predefine.formatters"
require "predefine.linters"

MAIN.plugin_manager.store {
    ["altercation/vim-colors-solarized"] = {},
    ["morhetz/gruvbox"] = {},
    ["ray-x/go.nvim"] = {
        requires = {"nvim-treesitter/nvim-treesitter"},
        config = function()
            local ok, go = pcall(require, "go")
            if not ok then
                return
            end
            MAIN.autocmds.set {
                _auto_format_go = {
                    {"BufWritePre", "*.go", ":silent! lua require('go.format').goimport()"}
                }
            }
            local on_attach = function(_, bufnr)
                MAIN.keymappings.set {
                    {
                        group = {
                            ["<leader>"] = {
                                ["l"] = {
                                    name = "LSP",
                                    ["p"] = {"<cmd>GoFillStruct<cr>", "Fill struct"},
                                    ["i"] = {"<cmd>GoInstallBinaries<cr>", "Install binaries"},
                                    ["u"] = {"<cmd>GoInstallBinaries<cr>", "Update binaries"},
                                    ["t"] = {"<cmd>GoAddTag<cr>", "Add tags"},
                                    ["T"] = {"<cmd>GoRmTag<cr>", "Remove tags"},
                                    ["I"] = {"<cmd>GoImpl <cr>", "Implement {receiver} {interface}"},
                                    ["a"] = {"<cmd>GoAlt!<cr>", "Open alternative file"},
                                    ["l"] = {"<cmd>GoLint<cr>", "Lint file"}
                                }
                            }
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
            local custom_opt_fn = function(opts, server_name)
                if server_name ~= "gopls" then
                    return opts
                end

                MAIN.configs["lspconfig"].set_on_attach(opts, on_attach)
                return opts
            end
            MAIN.configs["lspconfig"].set_custom_options {custom_opt_fn}
            go.setup {
                goimport = "gopls",
                gopls_cmd = MAIN.configs["lspinstaller"].settings.install_root_dir .. "/go/gopls",
                gofmt = "gofumpt",
                max_line_len = 120,
                tag_transform = false,
                test_template = "",
                test_template_dir = "",
                comment_placeholder = "",
                icons = {breakpoint = "??", currentpos = "??"},
                verbose = false,
                lsp_cfg = false,
                lsp_gofumpt = false,
                lsp_on_attach = nil,
                lsp_codelens = true,
                gopls_remote_auto = true,
                fillstruct = "gopls",
                lsp_diag_hdlr = true,
                dap_debug = true,
                test_runner = "go",
                run_in_floaterm = false,
                build_tags = "tag1,tag2"
            }
        end
    }
}

MAIN.colorscheme = "gruvbox"
MAIN.options.manage {background = "dark", transparent = false}
