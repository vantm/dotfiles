local bufferline = require 'bufferline'
bufferline.setup {
    options = {
        style_preset = {
            bufferline.style_preset.no_italic,
        },
        close_command = false,
        right_mouse_command = false,
        left_mouse_command = false,
        middle_mouse_command = false,
        indicator = {
            style = 'none',
        },
        buffer_close_icon = nil,
        show_buffer_close_icons = false,
        show_close_icon = false,
    }
}
