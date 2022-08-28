local colors = require('nitepal.colors')
local nitepal = {}

function nitepal.colorscheme(style)
    style = style or vim.o.background

    if style ~= 'dark' and style ~= 'light' then
        error('Invalid style: ' .. style)
    end

    local palette = colors.get_colors()
end

return nitepal
