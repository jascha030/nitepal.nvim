local M = {}

--@class Palette
local palette = {
    white          = '#969ac9',
    bright_white   = '#fffcfc',
    alt_white      = '#6183bb',

    black          = '#32466e',
    bright_black   = '#465a82',
    dark_black     = '#1f2335',
    alt_black      = '#232235',

    gray           = '#737aa2',
    gray1          = '#6172b0',
    gray2          = '#545c7e',
    gray3          = '#3b4261',

    red            = '#ea1479',
    bright_red     = '#f47cb4',
    dark_red       = '#d4007c',
    alt_red        = '#ff007c',

    orange         = '#f05033',
    bright_orange  = '#ff8000',

    yellow         = '#ffcc00',
    bright_yellow  = '#ffae31',

    green          = '#2da44e',
    bright_green   = '#9ece6a',
    dark_green     = '#5d7b23',
    alt_green      = '#8fd742',

    cyan           = '#0a6e81',
    bright_cyan    = '#1abc9c',
    alt_cyan       = '#41a6b5',

    blue           = '#3d59a1',
    bright_blue    = '#8494FF',
    dark_blue      = '#364A82',
    alt_blue       = '#0083f7',

    magenta        = '#6f42c1',
    bright_magenta = '#A59BFF',
    alt_magenta    = '#5f5fec',

    purple         = '#9d7cd8',
    bright_purple  = '#bb9af7',

    pink           = '#efc9f2',
    none           = 'NONE',
}

local colors = {
    variants = {
        light = {
            bg      = '#e7e9ef',
            fg      = '#444a73',
        },
        dark = {
            bg      = '#1e2030',
            fg      = '#c8d3f5',
        },
    },
    palette = palette,
}

local function merge_colors(types, shared)
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
    return merge_colors(colors.variants, colors.palette)
end

return M
