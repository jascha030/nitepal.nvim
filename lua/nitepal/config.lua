local M = {}

--@class Config
local defaults = {
    style = false, -- default: false, Choices: false 'dark', 'light'. When false vim.o.background will be used.
    transparent = {
        background = false,
        cursorline = false,
        sidebars = false,
        floats = false,
        popups = false,
    },
    contrast = true,
    italics = true,
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
            ['namespace.keyword'] = 'TSNamespaceKeyword',
            ['namespace.use'] = 'TSNamespaceUse',
            ['scope.static'] = 'TSScopeStatic',
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
