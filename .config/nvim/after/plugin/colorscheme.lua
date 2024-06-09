vim.o.background = "dark"

require 'gruvbox'.setup {
    disable_italics = true,
    disable_background = true,
    transparent_mode = true,
    italic = {
        strings = false,
        emphasis = false,
        comments = true,
        operators = false,
        folds = false
    }
}

vim.cmd([[colorscheme gruvbox]])
