local utils = require('nitepal.utils')
local config = require('nitepal.config')

local darken = utils.darken
local lighten = utils.lighten
local brighten = utils.brighten

local M = {}

function M.generate(style)
    --@class Palette
    local colors = require('nitepal.palette').get_colors()
    local scheme = {}

    colors = colors[style] or colors.dark

    local static = {
        bg = colors.bg,
        blue0 = colors.blue,
        red = colors.red,
        red1 = colors.orange,
        none = colors.none,
    }

    local function bg(shade)
        shade = shade or 0

        return config.options.contrast == true and darken(colors.bg, shade) or colors.bg
    end

    if vim.o.background == 'dark' then
        local bg_lighter = lighten(colors.bg, 0.01)
        local highlight = brighten(colors.alt_black, 0.05)

        scheme = vim.tbl_deep_extend('force', static, {
            error = brighten(colors.alt_red, 0.15),
            fg = colors.fg,
            fg_dark = colors.fg,
            bg_search = colors.blue,
            bg_dark = bg(0.05),
            bg_float = bg(0.05),
            bg_highlight = highlight,
            bg_popup = bg(0.05),
            bg_sidebar = bg_lighter,
            bg_statusline = '#1f2335',
            bg_visual = '#364A82',
            black = colors.alt_black,
            border = colors.alt_black,
            blue = '#7aa2f7',
            blue1 = colors.bright_magenta,
            blue2 = '#0db9d7',
            blue5 = '#89ddff',
            blue6 = '#B4F9F8',
            blue7 = '#394b70',
            border_highlight = colors.fg,
            comment = lighten(brighten(colors.bg, 0.35), 0.025),
            cyan = colors.bright_blue,
            dark3 = colors.gray2,
            dark5 = colors.gray,
            fg_gutter = brighten(colors.bg, 0.20),
            fg_sidebar = colors.fg,
            diff = {
                add = '#283B4D',
                change = '#272D43',
                delete = '#3F2D3D',
                text = '#394b70',
            },
            git = {
                add = colors.alt_cyan,
                change = colors.alt_white,
                conflict = lighten(colors.orange, 0.4),
                delete = '#914c54',
                ignore = colors.gray2,
            },
            gitSigns = {
                add = '#266d6a',
                change = colors.gray3,
                delete = colors.orange,
            },
            green = colors.bright_green,
            green1 = colors.bright_blue,
            green2 = colors.alt_cyan,
            hint = colors.bright_cyan,
            info = colors.cyan,
            magenta = colors.bright_purple,
            magenta2 = colors.alt_red,
            magenta3 = colors.pink,
            orange = colors.bright_orange,
            purple = colors.purple,
            teal = colors.red,
            warning = colors.bright_orange,
            yellow = colors.bright_yellow,
            ['function'] = colors.pink,
            keyword = colors.bright_purple,
        })
    else
        scheme = vim.tbl_deep_extend('force', static, {
            error = brighten(colors.red, -0.2),
            fg = darken(colors.alt_blue, 0.25),
            fg_dark = colors.fg,
            fg_sidebar = colors.gray,
            -- fg_gutter = '#a8aecb',
            fg_gutter = brighten(colors.bg, -0.175),
            bg_dark = darken(colors.bg, 0.025),
            bg_search = '#7890dd',
            bg_float = colors.bg,
            bg_popup = colors.none,
            bg_highlight = darken(colors.bg, 0.03),
            bg_sidebar = darken(colors.bg, 0.009),
            bg_statusline = darken(colors.bg, 0.009),
            bg_visual = brighten(colors.bright_magenta, 0.4),
            border_highlight = '#7890dd',
            black = colors.bg,
            blue = brighten(colors.blue, 0.2),
            blue1 = lighten(brighten(colors.alt_blue, -0.2), 0.1),
            blue2 = darken(colors.alt_cyan, 0.1),
            blue5 = darken(colors.cyan, 0.05),
            blue6 = '#2e5857',
            blue7 = '#92a6d5',
            border = '#e9e9ed',
            comment = brighten(lighten(colors.fg, 0.6), -0.2),
            cyan = brighten(colors.red, -0.1),
            dark3 = '#8990b3',
            dark5 = '#68709a',
            green = darken(colors.bright_green, 0.4),
            green1 = brighten(colors.bright_blue, -0.15),
            green2 = colors.alt_cyan,
            hint = colors.bright_cyan,
            info = colors.cyan,
            magenta = brighten(colors.purple, -0.25),
            magenta2 = darken(colors.bright_red, 0.05),
            magenta3 = brighten(colors.bright_purple, -0.25),
            orange = colors.bright_orange,
            purple = colors.red,
            teal = darken(colors.bright_red, 0.15),
            terminal_black = colors.black,
            warning = colors.bright_yellow,
            yellow = brighten(colors.bright_red, -0.05),
            ['function'] = brighten(colors.bright_purple, -0.25),
            keyword = darken(colors.bright_red, 0.05),
            diff = { add = '#aecde6', change = '#d6d8e3', delete = '#dfccd4', text = '#92a6d5' },
            git = {
                add = colors.alt_cyan,
                change = '#506d9c',
                conflict = '#8a5946',
                delete = '#c47981',
                ignore = '#8990b3',
            },
            gitSigns = { add = '#399a96', change = '#6482bd', delete = brighten(colors.red, -0.2) },
        })
    end

    return colors, scheme
end

local function set_terminal_colors(colors)
    vim.g.terminal_color_0 = colors.black
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_5 = colors.magenta
    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_7 = colors.white
    vim.g.terminal_color_8 = colors.bright_black
    vim.g.terminal_color_9 = colors.bright_red
    vim.g.terminal_color_10 = colors.bright_green
    vim.g.terminal_color_11 = colors.bright_yellow
    vim.g.terminal_color_12 = colors.bright_blue
    vim.g.terminal_color_13 = colors.bright_purple
    vim.g.terminal_color_14 = colors.bright_cyan
    vim.g.terminal_color_15 = colors.bright_white
    vim.g.terminal_color_background = colors.bg
    vim.g.terminal_color_foreground = colors.fg
end

local function set_highlight(group, color)
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
    local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
    local sp = color.sp and 'guisp=' .. color.sp or ''

    local hl = 'highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp

    if color.link then
        vim.cmd('highlight! link ' .. group .. ' ' .. color.link)
    else
        vim.cmd(hl)
    end
end

local function set_syntax(syntax)
    for group, colors in pairs(syntax) do
        set_highlight(group, colors)
    end
end

function M.init()
    local colors, scheme = M.generate(vim.o.background)
    local theme = require('nitepal.highlights').setup_hl_colors(scheme, colors)

    set_terminal_colors(colors)
    set_syntax(theme.base)
    set_syntax(theme.plugins)
end

function M.generate_lualine(style)
    local _, scheme = require('nitepal.theme').generate(style)

    return {
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
end

return M
