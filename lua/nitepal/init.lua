local nitepal = {}

function nitepal.colorscheme(style)
    style = style or vim.o.background

    if style ~= 'dark' and style ~= 'light' then
        error('Invalid style: ' .. style)
    end

    vim.cmd([[hi clear]])

    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end

    vim.o.background = style
    vim.o.termguicolors = true
    vim.g.colors_name = style == 'dark' and 'nitepal' or 'litepal'

    require('nitepal.utils').init()
end

return nitepal
