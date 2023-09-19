vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
    view = {
        number = true,
        relativenumber = true,
        float = {
            enable = true,
            open_win_config = {
                width = 80,
                height = 40,
                row = 1,
                col = 1,
            },
        }
    },
    filters = {
        custom = {
            "/?node_modules/",
            "/?\\.git/",
            "/?bin/",
            "/?obj/",
            "/?dist/",
            "/?build/",
            "^node_modules$",
            "^\\.git$",
            "^bin$",
            "^obj$",
            "^dist$",
            "^build$",
        }
    }
}
