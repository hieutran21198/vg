MAIN.keymappings.manage {
    {
        group = {
            ["<leader>"] = {
                ["p"] = {
                    name = "Packer",
                    ["i"] = {"<cmd>PackerInstall<cr>", "Install components"},
                    ["C"] = {"<cmd>PackerCompile<cr>", "Compile"},
                    ["c"] = {"<cmd>PackerClean<cr>", "Clean"},
                    ["s"] = {"<cmd>PackerSync<cr>", "Sync"},
                    ["l"] = {"<cmd>PackerLoad<cr>", "Load components"},
                    ["p"] = {"<cmd>PackerProfile<cr>", "Profiling"},
                    ["S"] = {"<cmd>PackerStatus<cr>", "Status"},
                    ["u"] = {"<cmd>PackerUpdate<cr>", "Update"}
                },
                ["R"] = {
                    "<cmd>lua MAIN.reload()<cr>",
                    "Reload " .. MAIN.paths.appname
                }
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

MAIN.keymappings.manage({
    insert_mode = {
        ["jk"] = "<ESC>",
        ["kj"] = "<ESC>",
        ["jj"] = "<ESC>",
        ["<A-j>"] = "<Esc>:m .+1<CR>==gi",
        ["<A-k>"] = "<Esc>:m .-2<CR>==gi",
        ["<A-Up>"] = "<C-\\><C-N><C-w>k",
        ["<A-Down>"] = "<C-\\><C-N><C-w>j",
        ["<A-Left>"] = "<C-\\><C-N><C-w>h",
        ["<A-Right>"] = "<C-\\><C-N><C-w>l"
    },
    normal_mode = {
        d = '"_d',
        D = '"_D',
        ["<C-h>"] = "<C-w>h",
        ["<C-j>"] = "<C-w>j",
        ["<C-k>"] = "<C-w>k",
        ["<C-l>"] = "<C-w>l",
        ["<C-Up>"] = ":resize -2<CR>",
        ["<C-Down>"] = ":resize +2<CR>",
        ["<C-Left>"] = ":vertical resize -2<CR>",
        ["<C-Right>"] = ":vertical resize +2<CR>",
        ["<S-l>"] = ":BufferNext<CR>",
        ["<S-h>"] = ":BufferPrevious<CR>",
        ["<A-j>"] = ":m .+1<CR>==",
        ["<A-k>"] = ":m .-2<CR>=="
    },
    term_mode = {
        ["<C-h>"] = "<C-\\><C-N><C-w>h",
        ["<C-j>"] = "<C-\\><C-N><C-w>j",
        ["<C-k>"] = "<C-\\><C-N><C-w>k",
        ["<C-l>"] = "<C-\\><C-N><C-w>l"
    },
    visual_mode = {["<"] = "<gv", [">"] = ">gv", d = '"_d', D = '"_D'},
    visual_block_mode = {
        ["K"] = ":move '<-2<CR>gv-gv",
        ["J"] = ":move '>+1<CR>gv-gv",
        ["<A-j>"] = ":m '>+1<CR>gv-gv",
        ["<A-k>"] = ":m '<-2<CR>gv-gv",
        ["<C-o"] = [[:<c-u>let @/=@"<cr>gvy:let [@/,@"]=[@",@/]<cr>/\V<c-r>=substitute(escape(@/,'/\'),'\n','\\n','g')<cr><cr>]]
    }
}, true)
