local M = {}

--@class Palette
--@field white string #969ac9
--@field bright_white string #fffcfc
--@field alt_white string #6183bb
--@field black string #32466e
--@field bright_black string #465a82
--@field dark_black string #1f2335
--@field alt_black string #232235
--@field gray string #737aa2
--@field gray1 string #6172b0
--@field gray2 string #545c7e
--@field gray3 string #3b4261
--@field red string #ea1479
--@field bright_red string #f47cb4
--@field dark_red string #d4007c
--@field alt_red string #ff007c
--@field orange string #f05033
--@field bright_orange string #ff8000
--@field yellow string #ffcc00
--@field bright_yellow string #ffae31
--@field green string #2da44e
--@field bright_green string #9ece6a
--@field dark_green string #5d7b23
--@field alt_green string #8fd742
--@field cyan string #0a6e81
--@field bright_cyan string #1abc9c
--@field alt_cyan string #41a6b5
--@field blue string #3d59a1
--@field bright_blue string #8494FF
--@field dark_blue string #364A82
--@field alt_blue string #0083f7
--@field magenta string #6f42c1
--@field bright_magenta string #A59BFF
--@field alt_magenta string #5f5fec
--@field purple string #9d7cd8
--@field bright_purple string #bb9af7
--@field alt_purple string #C792EA
--@field pink string #efc9f2
--@field none string NONE
local palette = {
    white = '#969ac9',
    bright_white = '#fffcfc',
    alt_white = '#6183bb',

    black = '#32466e',
    bright_black = '#465a82',
    dark_black = '#1f2335',
    alt_black = '#232235',

    gray = '#737aa2',
    gray1 = '#6172b0',
    gray2 = '#545c7e',
    gray3 = '#3b4261',

    red = '#ea1479',
    bright_red = '#f47cb4',
    dark_red = '#d4007c',
    alt_red = '#ff007c',

    orange = '#f05033',
    bright_orange = '#ff8000',

    yellow = '#ffcc00',
    bright_yellow = '#ffae31',

    green = '#2da44e',
    bright_green = '#9ece6a',
    dark_green = '#5d7b23',
    alt_green = '#8fd742',

    cyan = '#0a6e81',
    bright_cyan = '#1abc9c',
    alt_cyan = '#41a6b5',

    blue = '#3d59a1',
    bright_blue = '#8494FF',
    dark_blue = '#364A82',
    -- alt_blue       = '#0083f7',
    alt_blue = '#467CDA',

    magenta = '#6f42c1',
    bright_magenta = '#A59BFF',
    alt_magenta = '#5f5fec',

    purple = '#9d7cd8',
    bright_purple = '#bb9af7',
    alt_purple = '#C792EA',

    pink = '#efc9f2',
    none = 'NONE',
}

local colors = {
    variants = {
        light = {
            -- bg = '#e7e9ef',
            bg = '#e0e1eb',
            fg = '#444a73',
        },
        dark = {
            bg = '#1e2030',
            fg = '#c8d3f5',
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
    local theme_colors = merge_colors(colors.variants, colors.palette)

    -- Dirty quick fix need to refactor
    theme_colors.light = require('nitepal.utils').lightmode(theme_colors.light)
    theme_colors.light.bg = colors.variants.light.bg
    theme_colors.light.fg = colors.variants.light.fg

    -- require('snacks.debug').log(require('nitepal.utils').lightmode(theme_colors.light))

    return theme_colors
end

function M.get_palette()
    return colors
end

return M
