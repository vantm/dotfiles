vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup {
    view = {
        number = true,
        relativenumber = true,
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
