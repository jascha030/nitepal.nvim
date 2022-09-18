local M = {}

--@class Config
local defaults = {
    style = false, -- default: false, Choices: false 'dark', 'light'. When false vim.o.background will be used.
    disable = {
        background = false,
        cursorline = false,
        sidebars = false,
    },
    italics = true,
    disabled_as_transparent = true, -- When true, hl options that are set in disable will be set as "NONE".
    colors = {
        --@field overrides Palette
        overrides = {}, -- Override colors defined in nitepal.palette.
        custom = {}, -- Add custom colors.
    },
    treesitter = {
        enable = true,
        captures = {
            ['className'] = 'TSClassName',
            ['modifier.final'] = 'TSModifierFinal',
            ['scope.relative'] = 'TSScopeRelative',
            ['object.var'] = 'TSMemberObjectVar',
            ['namespaceUse'] = 'TSNamespaceUse',
            ['selector.tag'] = 'TSConstant',
            ['selector.id'] = 'TSSelector',
            ['selector.class'] = 'TSClassName',
        },
    },
}

M.options = {}

--@param options Config|nil
function M.setup(options)
    M.options = vim.tbl_deep_extend('force', {}, defaults, options or {})
end

--@param options Config|nil
function M.extend(options)
    M.options = vim.tbl_deep_extend('force', {}, M.options or defaults, options or {})
end

M.setup()

return M
