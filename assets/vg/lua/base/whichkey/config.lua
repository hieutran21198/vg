MAIN.configs["keymappings"] = {
    setup = {
        plugins = {
            marks = true,
            registers = true,
            presets = {
                operators = true,
                motions = true,
                text_objects = false,
                window = true,
                nav = true,
                z = true,
                g = true
            },
            spelling = {enabled = true, suggestions = 20}
        },
        icons = {breadcrumb = "»", separator = "➜", group = "+"},
        window = {
            border = "none",
            position = "bottom",
            margin = {1, 0, 1, 0},
            padding = {2, 2, 2, 2}
        },
        layout = {
            height = {min = 4, max = 25},
            width = {min = 20, max = 50},
            spacing = 3
        },
        popup_mappings = {
            scroll_down = "<c-d>", -- binding to scroll down inside the popup
            scroll_up = "<c-u>" -- binding to scroll up inside the popup
        },
        triggers = "auto",
        hidden = {
            "<silent>",
            "<cmd>",
            "<Cmd>",
            "<CR>",
            "call",
            "lua",
            "^:",
            "^ "
        },
        show_help = true
    },
    keymappings = {}
}
