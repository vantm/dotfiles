require 'mason'.setup {}

require 'mason-lspconfig'.setup {
    ensure_installed = {
        'bashls',
        'cssls',
        'html',
        'jsonls',
        'yamlls'
    },
    automatic_installation = false
}

require 'null-ls'.setup {}
