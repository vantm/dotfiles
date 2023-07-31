local actions = require 'telescope.actions'

require 'telescope'.setup {
    defaults = {
        mappings = {
            i = {
                ['<Down>'] = actions.move_selection_next,
                ['<Up>'] = actions.move_selection_previous,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous
            }
        }
    },
    pickers = {
        find_files = {
            find_command = {
                'rg',
                '--files',
                '-g', '!**/.git/*',
                '-g', '!**/node_modules/*',
                '-g', '!**/.vs/*',
                '-g', '!**/.idea/*',
                '-g', '!**/dist/*',
                '-g', '!**/bin/*',
                '-g', '!**/obj/*',
                '-g', '!**/*.lock',
                '-g', '!**/*.lock.json',
                '-g', '!**/*.{dll,bin,min.js,min.css}'
            }
        },
    },
}
