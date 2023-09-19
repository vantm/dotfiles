vim.cmd [[highlight IndentBlanklineIndent1 guifg=#3e1e20 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#3f3521 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#3c4d30 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#22484d gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#26465f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#37213d gui=nocombine]]

require 'indent_blankline'.setup {
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
