local actions = require 'telescope.actions'

require 'telescope'.setup {
    defaults = {
        file_ignore_patterns = {
            "**/.git/",
            "**/node_modules/",
            "**/dist/",
            "**/build/",
            "**/bin/",
            "**/obj/",
            ".git/",
            "node_modules/",
            "dist/",
            "build/",
            "bin/",
            "obj/",
        },

        mappings = {
            i = {
                ['<Down>'] = actions.move_selection_next,
                ['<Up>'] = actions.move_selection_previous,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-[>'] = actions.close,
                ['<C-c>'] = actions.close,
                ['<Esc>'] = actions.close,
            }
        }
    }
}
