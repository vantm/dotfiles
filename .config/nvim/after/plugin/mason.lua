require 'mason'.setup {}

require 'mason-lspconfig'.setup {
    ensure_installed = {
        'bashls',
        'cssls',
        'gopls',
        'html',
        'jsonls',
        'jdtls',
        'lua_ls',
        'pyright',
        'rust_analyzer',
        'tsserver',
        'omnisharp',
        'yamlls'
    },
    automatic_installation = true
}

require 'null-ls'.setup {}
