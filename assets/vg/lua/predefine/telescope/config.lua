MAIN.configs["telescope"] = {
    lazy_setup = function()
        local actions = require("telescope.actions")
        local action_layout = require("telescope.actions.layout")
        return {
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-p>"] = action_layout.toggle_preview
                    }
                },
                preview = {hide_on_startup = true}
            }
        }
    end,
    setup = {
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.75,
            prompt_position = "bottom",
            preview_cutoff = 120,
            horizontal = {mirror = false},
            vertical = {mirror = false}
        },
        file_ignore_patterns = {},
        path_display = {shorten = 5},
        winblend = 0,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"},
        defaults = {
            vimgrep_arguments = {
                "rg", "--color=never", "--no-heading", "--with-filename",
                "--line-number", "--column", "--smart-case", "-u"
            }
        }
    }
}

MAIN.keymappings.manage {
    {
        group = {
            ["<leader>"] = {
                ["f"] = {"<cmd>Telescope find_files<cr>", "Find files"},
                ["r"] = {"<cmd>Telescope oldfiles<cr>", "Recent files"},
                ["s"] = {"<cmd>Telescope live_grep<cr>", "Search"},
                ["T"] = {"<cmd>Telescope colorscheme<cr>", "Colorschemes"}
            }
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
