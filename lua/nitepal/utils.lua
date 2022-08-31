local M = {}

local function darken(n, f)
    return n * (1 - f)
end

M.hex2rgb = function(hex)
    hex = hex:gsub('#', '')

    return tonumber('0x' .. hex:sub(1, 2), 16), tonumber('0x' .. hex:sub(3, 4), 16), tonumber('0x' .. hex:sub(5, 6), 16)
end

M.rgb2hex = function(r, g, b)
    return string.format('#%02x%02x%02x', r, g, b)
end

M.rgbratio2hex = function(r, g, b)
    return string.format('#%02x%02x%02x', r * 255, g * 255, b * 255)
end

M.darken = function(hex, factor)
    local rF, gF, bF = M.hex2rgb(hex)

    return M.rgb2hex(darken(rF, factor), darken(gF, factor), darken(bF, factor))
end

local function lighten(n, f)
    return math.min(n + (255 - n) * f, 255)
end

M.lighten = function(hex, factor)
    local rF, gF, bF = M.hex2rgb(hex)
    return M.rgb2hex(lighten(rF, factor), lighten(gF, factor), lighten(bF, factor))
end

return M
