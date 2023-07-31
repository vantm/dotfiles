local bufferline = require 'bufferline'
bufferline.setup {
    options = {
        style_preset = {
            bufferline.style_preset.no_italic,
            bufferline.style_preset.no_bold
        },
        indicator = {
            icon = '',
            style = 'underline',
        },
        buffer_close_icon = ''
    }
}
