local nitepal = {}

function nitepal.colorscheme(style)
    if require('nitepal.config').options.style == false then
        style = style or vim.o.background

        require('nitepal.config').options.style = style
    else
        style = require('nitepal.config').options.style
    end

    if style ~= 'dark' and style ~= 'light' then
        error('Invalid style: ' .. style)
    end

    vim.cmd([[hi clear]])

    if vim.fn.exists([[syntax_on]]) then
        vim.cmd([[syntax reset]])
    end

    if vim.o.background ~= style then
        vim.o.background = style
    end

    vim.o.termguicolors = true
    vim.g.colors_name = style == 'dark' and 'nitepal' or 'litepal'

    require('nitepal.theme').init()
end

return nitepal
