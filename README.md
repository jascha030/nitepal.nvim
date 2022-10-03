# Nitepal.nvim (WIP)

Colorscheme I have been using, which started as Material Palenight but has evolved over time to fit my personal taste.

## Config

```lua 
local defaults = {
    style = false, -- default: false, Choices: false 'dark', 'light'. When false vim.o.background will be used.
    transparent = {
        background = false,
        cursorline = false,
        sidebars = false,
        floats = false,
        popups = false,
    },
    contrast = true, -- Darker backgrounds for sidebars, popups, floats etc. (when not transparent).
    italics = true,
    colors = {
        --@field overrides Palette
        overrides = {}, -- Override colors defined in nitepal.palette.
        custom = {}, -- Add custom colors.
    },
    treesitter = {
        enable = true, -- Enable custom treesitter queries in scheme.
        captures = { -- Custom capture groups and highlightnames.
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
```
