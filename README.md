# nitepal.nvim

Colorscheme I have been using, which started as Material Palenight but has evolved over time to fit my personal taste.

**⚠️ Warning: some colors or highlight groups might change as this is an early release.**

## Installation

**Using Packer:**

```lua
use { 'jascha030/nitepal.nvim' }
```

## Config

```lua 
local defaults = {
    style = false, -- default: false, Choices: false 'dark', 'light'. When false vim.o.background will be used.
    transparent = {
        background = false -- Disables editor bg (if you want to use your terminal bg instead),
        sidebars = false 
        floats = false 
        popups = false
    },
    contrast = true,
    italics = true,
    colors = {
        --@field overrides Palette
        overrides = {}, -- Override colors defined in nitepal.palette.
        custom = {}, -- Add custom colors.
    },
}
```
