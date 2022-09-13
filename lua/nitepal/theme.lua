local utils = require('nitepal.utils')

local darken = utils.darken
local lighten = utils.lighten
local brighten = utils.brighten

local M = {}

function M.generate(style)
    local colors = require('nitepal.utils.palette').get_colors()
    colors = colors[style] or colors.dark

    local scheme = {}

    if vim.o.background == 'dark' then
        scheme = {
            fg = colors.fg,
            bg = colors.bg,
            bg_dark = darken(colors.bg, 0.05),
            bg_float = colors.none,
            -- bg_highlight = brighten(colors.bg, 0.1),
            bg_highlight = brighten('#232235', 0.05),
            bg_popup = colors.bg,
            bg_search = colors.blue,
            bg_sidebar = lighten(colors.bg, 0.01),
            bg_statusline = '#1f2335',
            bg_visual = '#364A82',
            black = colors.alt_black,
            border = colors.alt_black,
            blue = '#7aa2f7',
            blue0 = colors.blue,
            blue1 = '#A59BFF',
            blue2 = '#0db9d7',
            blue5 = '#89ddff',
            blue6 = '#B4F9F8',
            blue7 = '#394b70',
            border_highlight = colors.blue,
            comment = '#565f89',
            cyan = colors.bright_blue,
            dark3 = '#545c7e',
            dark5 = '#737aa2',
            diff = {
                add = '#283B4D',
                change = '#272D43',
                delete = '#3F2D3D',
                text = '#394b70',
            },
            error = darken(colors.orange, 0.1),
            fg_dark = '#a9b1d6',
            fg_gutter = '#3b4261',
            fg_sidebar = '#a9b1d6',
            git = {
                add = colors.alt_cyan,
                change = '#6183bb',
                conflict = '#bb7a61',
                delete = '#914c54',
                ignore = '#545c7e',
            },
            gitSigns = {
                add = '#266d6a',
                change = '#536c9e',
                delete = colors.orange,
            },
            green = colors.bright_green,
            green1 = colors.bright_blue,
            green2 = colors.alt_cyan,
            hint = colors.bright_cyan,
            info = colors.cyan,
            magenta = colors.bright_magenta,
            magenta2 = colors.alt_red,
            magenta3 = '#EFC9F2',
            none = colors.none,
            orange = colors.bright_orange,
            purple = colors.purple,
            red = colors.red,
            red1 = colors.orange,
            teal = colors.red,
            warning = colors.bright_orange,
            yellow = colors.bright_yellow,
        }
    else
        scheme = {
            bg = colors.bg,
            bg_dark = colors.bg,
            bg_float = colors.bg,
            bg_highlight = darken(colors.bg, 0.03),
            bg_popup = colors.none,
            bg_search = '#7890dd',
            bg_sidebar = darken(colors.bg, 0.009),
            bg_statusline = darken(colors.bg, 0.009),
            bg_visual = lighten(colors.red, 0.8),
            black = colors.bg,
            blue = brighten(colors.blue, 0.2),
            blue0 = colors.blue,
            blue1 = '#188092',
            blue2 = '#07879d',
            blue5 = '#006a83',
            blue6 = '#2e5857',
            blue7 = '#92a6d5',
            border = '#e9e9ed',
            border_highlight = '#7890dd',
            comment = '#848cb5',
            -- cyan = '#007197',
            cyan = colors.red,
            dark3 = '#8990b3',
            dark5 = '#68709a',
            diff = {
                add = '#aecde6',
                change = '#d6d8e3',
                delete = '#dfccd4',
                text = '#92a6d5',
            },
            error = '#c64343',
            fg = darken(colors.alt_blue, 0.25),
            fg_dark = '#6172b0',
            fg_gutter = '#a8aecb',
            fg_sidebar = '#6172b0',
            git = {
                add = colors.alt_cyan,
                change = '#506d9c',
                conflict = '#8a5946',
                delete = '#c47981',
                ignore = '#8990b3',
            },
            gitSigns = {
                add = '#399a96',
                change = '#6482bd',
                delete = colors.orange,
            },
            green = darken(colors.bright_green, 0.4),
            green1 = brighten(colors.bright_blue, -0.15),
            green2 = colors.alt_cyan,
            hint = colors.bright_cyan,
            info = colors.cyan,
            magenta = brighten(colors.bright_magenta, -0.25),
            magenta2 = darken(colors.bright_red, 0.05),
            magenta3 = '#EFC9F2',
            orange = colors.bright_orange,
            purple = colors.red,
            red = colors.red,
            red1 = colors.orange,
            teal = darken(colors.bright_red, 0.15),
            terminal_black = colors.black,
            warning = colors.bright_yellow,
            yellow = brighten(colors.bright_red, -0.05),
            none = colors.none,
        }
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
    vim.g.terminal_color_13 = colors.bright_magenta
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
    local theme = require('nitepal.highlights').setup_hl_colors(scheme)

    set_terminal_colors(colors)
    set_syntax(theme.base)
    set_syntax(theme.plugins)
    -- util.autocmds(theme.config)
end

return M
