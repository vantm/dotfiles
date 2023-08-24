require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'c',
        'lua',
        'vim',
        'vimdoc',
        'go',
        'rust',
        'typescript',
        'javascript',
        'html',
        'css',
        'scss',
        'c_sharp',
        'sql',
        'markdown',
        'json',
        'yaml',
        'xml',
        'java'
    },
    highlight = {
        enable = true
    }
}
