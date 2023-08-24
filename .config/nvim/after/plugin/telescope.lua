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
    }
}
