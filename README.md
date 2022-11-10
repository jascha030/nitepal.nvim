# nitepal.nvim

<p align="center">
  <img src="https://github.com/jascha030/nitepal.nvim/blob/main/img/nitepal_php.png?raw=true" alt="Nitepal with a php project"/>
</p>

Colorscheme I have been using, (mainly in Jetbrains IDE's) which started as Material Palenight but has evolved over time to fit my personal taste.

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

## Acknowledgements

Used the [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim) codebase as an example to find out what would be a nice way to do this in lua, so you will see a lot of similar or even code taken directly from that repo.

[Tokyonight](https://github.com/folke/tokyonight.nvim) is also the scheme I had been using myself, overriding a bunch of the colors. I also seem to like the code style, as it feels more in line with code style I use for other languages, (still relatively new to lua).

[Material Theme UI](https://github.com/mallowigi/material-theme-issues) for Jetbrains was my original starting point and the scheme is ultimately based on the material palenight scheme.
