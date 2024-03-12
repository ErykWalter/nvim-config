return {
    'lewis6991/gitsigns.nvim',
    setup = function()
        local gitsigns = require('gitsigns')
        gitsigns.setup({
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'right_align',
                delay = 2000,
                ignore_whitespace = false,
            },
        })
    end,
}
