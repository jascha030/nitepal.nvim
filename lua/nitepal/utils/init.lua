local hsluv = require('nitepal.utils.hsluv')

---@class nitepal.Utils
local M = {}

M.day_brightness = 0.8

local function darken(n, f)
    return n * (1 - f)
end

function M.hex2rgb(hex)
    hex = hex:gsub('#', '')

    return tonumber('0x' .. hex:sub(1, 2), 16), tonumber('0x' .. hex:sub(3, 4), 16), tonumber('0x' .. hex:sub(5, 6), 16)
end

function M.rgb2hex(r, g, b)
    return string.format('#%02x%02x%02x', r, g, b)
end

function M.rgbratio2hex(r, g, b)
    return string.format('#%02x%02x%02x', r * 255, g * 255, b * 255)
end

function M.darken(hex, factor)
    local rF, gF, bF = M.hex2rgb(hex)

    return M.rgb2hex(darken(rF, factor), darken(gF, factor), darken(bF, factor))
end

local function lighten(n, f)
    return math.min(n + (255 - n) * f, 255)
end

function M.lighten(hex, factor)
    local rF, gF, bF = M.hex2rgb(hex)
    return M.rgb2hex(lighten(rF, factor), lighten(gF, factor), lighten(bF, factor))
end

function M.brighten(hex, perc)
    local hsl = hsluv.hex_to_hsluv(hex)
    local lSpace = perc < 0 and hsl[3] or 100 - hsl[3]

    hsl[3] = hsl[3] + lSpace * perc

    return hsluv.hsluv_to_hex(hsl)
end

function M.lightmode(color)
    if type(color) == 'table' then
        for key, value in pairs(color) do
            color[key] = M.lightmode(value)
        end
    elseif type(color) == 'string' then
        if color ~= 'NONE' then
            local hsl = hsluv.hex_to_hsluv(color)

            hsl[3] = hsl[3] > 70 and hsl[3] - 5 or hsl[3]
            hsl[2] = hsl[2] < 40 and hsl[2] + 3 or hsl[2]

            return hsluv.hsluv_to_hex(hsl)
        end
    end
    return color
end

return M
