local _, scheme = require('nitepal.theme').generate(vim.o.background or 'dark')

local nitepal = {
    normal = {
        a = { bg = scheme.blue1, fg = scheme.black },
        b = { bg = scheme.fg_gutter, fg = scheme.blue1 },
        c = { bg = scheme.bg_statusline, fg = scheme.fg_sidebar },
    },
    insert = {
        a = { bg = scheme.green, fg = scheme.black },
        b = { bg = scheme.fg_gutter, fg = scheme.green },
    },
    command = {
        a = { bg = scheme.yellow, fg = scheme.black },
        b = { bg = scheme.fg_gutter, fg = scheme.yellow },
    },
    visual = {
        a = { bg = scheme.magenta, fg = scheme.black },
        b = { bg = scheme.fg_gutter, fg = scheme.magenta },
    },
    replace = {
        a = { bg = scheme.red, fg = scheme.black },
        b = { bg = scheme.fg_gutter, fg = scheme.red },
    },
    inactive = {
        a = { bg = scheme.bg_statusline, fg = scheme.blue },
        b = { bg = scheme.bg_statusline, fg = scheme.fg_gutter, gui = 'bold' },
        c = { bg = scheme.bg_statusline, fg = scheme.fg_gutter },
    },
}

return nitepal
