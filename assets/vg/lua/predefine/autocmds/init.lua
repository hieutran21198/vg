MAIN.autocmds.manage {
    _general_config = {
        {"TextYankPost", "*", "lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})"},
        {"BufWinEnter", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"},
        {"BufRead", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"},
        {"BufNewFile", "*", "setlocal formatoptions-=c formatoptions-=r formatoptions-=o"},
        {"FileType", "qf", "set nobuflisted"}
    },
    _filetypechanges = {
        {"BufWinEnter", ".tf", "setlocal filetype=terraform"},
        {"BufRead", "*.tf", "setlocal filetype=terraform"},
        {"BufNewFile", "*.tf", "setlocal filetype=terraform"},
        {"BufWinEnter", ".zsh", "setlocal filetype=sh"},
        {"BufRead", "*.zsh", "setlocal filetype=sh"},
        {"BufNewFile", "*.zsh", "setlocal filetype=sh"}
    },
    _git = {{"FileType", "gitcommit", "setlocal wrap"}, {"FileType", "gitcommit", "setlocal spell"}},
    _markdown = {{"FileType", "markdown", "setlocal wrap"}, {"FileType", "markdown", "setlocal spell"}},
    _auto_resize = {{"VimResized", "*", "wincmd ="}},
    _general_lsp = {{"FileType", "lspinfo", "nnoremap <silent> <buffer> q :q<CR>"}}
}
