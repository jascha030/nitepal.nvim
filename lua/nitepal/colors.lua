local M = {}

local palette = {}
local variants = {
    light = {
        bg = '#e7e9ef',
        fg = '#444a73',
    },
    dark = {
        bg = '#1e2030',
        fg = '#c8d3f5',
    },
}

local palette = {
    black = '#32466e',
    red = '#ea1479',
    green = '#2da44e',
    yellow = '#ffcc00',
    blue = '#3d59a1',
    magenta = '#6f42c1',
    cyan = '#0a6e81',
    white = '#969ac9',

    bright_black = '#465a82',
    bright_red = '#f47cb4',
    bright_green = '#9ece6a',
    bright_yellow = '#ffae31',
    bright_blue = '#8494FF',
    bright_magenta = '#bb9af7',
    bright_cyan = '#1abc9c',
    bright_white = '#fffcfc',

    alt_black = '#1D202F',
    alt_red = '#ff007c',
    alt_green = '#8fd742',
    alt_yellow = '#ff8000',
    alt_blue = '#0083f7',
    bg_visual = '#364A82',
    alt_magenta = '#5f5fec',
    alt_cyan = '#41a6b5',
    alt_white = '#6183bb',
    purple = '#9d7cd8',

    additional = { git_orange = '#f05033' },

    none = 'NONE',
}

function M.merge_colors(types, shared)
    local scheme = {}

    for type, values in pairs(types) do
        for c, v in pairs(shared) do
            values[c] = v
        end

        scheme[type] = values
    end

    return scheme
end

function M.get_colors()
    return M.merge_colors(variants, palette)
end

return M
