vim.o.background = "dark"

require 'gruvbox'.setup {
    italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false
    },
    transparent_mode = true,
}

vim.cmd([[colorscheme gruvbox]])
