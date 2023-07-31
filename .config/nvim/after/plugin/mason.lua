require 'mason'.setup {}

require 'mason-lspconfig'.setup {
    ensure_installed = {
        'bashls',
        'csharp_ls',
        'cssls',
        'gopls',
        'html',
        'jsonls',
        'lua_ls',
        'pyright',
        'rust_analyzer',
        'tsserver',
    },
    automatic_installation = true
}

require 'null-ls'.setup {}
