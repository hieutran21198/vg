local utils = require "utils"

utils.require_dep(
    "nvim-tree",
    function()
        local tree_cb = require "nvim-tree.config".nvim_tree_callback
        MAIN.settings["nvim-tree"] = {
            g = {},
            setup = {
                disable_netrw = true,
                hijack_netrw = true,
                open_on_setup = false,
                ignore_ft_on_setup = {},
                auto_close = false,
                open_on_tab = false,
                hijack_cursor = false,
                update_cwd = false,
                update_to_buf_dir = {enable = true, auto_open = true},
                diagnostics = {
                    enable = false,
                    icons = {hint = "?", info = "?", warning = "?", error = "?"}
                },
                update_focused_file = {
                    enable = true,
                    update_cwd = false,
                    ignore_list = {}
                },
                system_open = {cmd = nil, args = {}},
                filters = {dotfiles = false, custom = {}},
                git = {enable = true, ignore = true, timeout = 500},
                view = {
                    width = 50,
                    height = 30,
                    hide_root_folder = false,
                    side = "left",
                    auto_resize = false,
                    number = false,
                    relativenumber = false,
                    signcolumn = "yes",
                    mappings = {
                        custom_only = false,
                        list = {
                            {key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit")},
                            {key = {"<2-RightMouse>", "m"}, cb = tree_cb("cd")},
                            {key = "<c-v>", cb = tree_cb("vsplit")},
                            {key = "<c-x>", cb = tree_cb("split")},
                            {key = "<c-t>", cb = tree_cb("tabnew")},
                            {key = "<", cb = tree_cb("prev_sibling")},
                            {key = ">", cb = tree_cb("next_sibling")},
                            {key = "P", cb = tree_cb("parent_node")},
                            {key = "<BS>", cb = tree_cb("close_node")},
                            {key = "<S-CR>", cb = tree_cb("close_node")},
                            {key = "<Tab>", cb = tree_cb("preview")},
                            {key = "K", cb = tree_cb("first_sibling")},
                            {key = "J", cb = tree_cb("last_sibling")},
                            {key = "<c-i>", cb = tree_cb("toggle_ignored")},
                            {key = "<c-H>", cb = tree_cb("toggle_dotfiles")},
                            {key = "r", cb = tree_cb("refresh")},
                            {key = "a", cb = tree_cb("create")},
                            {key = "d", cb = tree_cb("remove")},
                            {key = "D", cb = tree_cb("trash")},
                            {key = "<F2>", cb = tree_cb("rename")},
                            {key = "<C-r>", cb = tree_cb("full_rename")},
                            {key = "x", cb = tree_cb("cut")},
                            {key = "c", cb = tree_cb("copy")},
                            {key = "p", cb = tree_cb("paste")},
                            {key = "y", cb = tree_cb("copy_name")},
                            {key = "Y", cb = tree_cb("copy_path")},
                            {key = "gy", cb = tree_cb("copy_absolute_path")},
                            {key = "[c", cb = tree_cb("prev_git_item")},
                            {key = "]c", cb = tree_cb("next_git_item")},
                            {key = "-", cb = tree_cb("dir_up")},
                            {key = "s", cb = tree_cb("system_open")},
                            {key = "q", cb = tree_cb("close")},
                            {key = "g?", cb = tree_cb("toggle_help")}
                        }
                    }
                },
                trash = {cmd = "trash", require_confirm = true}
            }
        }

        MAIN.keymappings.manage {
            {
                group = {
                    ["<leader>"] = {["e"] = {"<cmd>NvimTreeToggle<cr>", "Explorer"}}
                },
                opts = {
                    mode = "n",
                    buffer = nil,
                    silent = true,
                    noremap = true,
                    nowait = true
                }
            }
        }
    end
)

MAIN.configs["nvim-tree"] = function()
    local ok, nvim_tree = pcall(require, "nvim-tree")
    if not ok then
        return
    end
    local settings = MAIN.settings["nvim-tree"]
    local setup = settings.setup
    MAIN.g.set(settings.g)
    nvim_tree.setup(setup)
end
