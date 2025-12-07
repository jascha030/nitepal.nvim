# 🌙 nitepal.nvim

<p align="center">
  <img src="https://github.com/jascha030/nitepal.nvim/blob/main/img/nitepal_php.png?raw=true" alt="Nitepal Hero" width="800"/>
</p>

<p align="center">
    <a href="https://github.com/neovim/neovim">
        <img src="https://img.shields.io/badge/Neovim-0.8+-blueviolet.svg?style=flat-square&logo=neovim&logoColor=white" alt="Neovim"/>
    </a>
    <a href="https://github.com/lua/lua">
        <img src="https://img.shields.io/badge/Lua-5.1-blue.svg?style=flat-square&logo=lua&logoColor=white" alt="Lua"/>
    </a>
</p>

<p align="center">
  <strong>A dark and light Neovim colorscheme inspired by Material Palenight and Tokyonight.</strong>
</p>

---

**nitepal.nvim** is a highly customizable colorscheme for Neovim written in Lua. It started as a personal port of the Material Palenight theme (popular in the JetBrains ecosystem) but has evolved to incorporate the structural logic and cleanliness of `folke/tokyonight.nvim`.

It comes in two flavors:
*   🌑 **Nitepal:** A deep, cool dark theme.
*   ☀️ **Litepal:** A soft, clean light theme.

> **⚠️ Warning:** This is an early release. Highlight groups and colors are subject to change as I tweak them for my daily workflow.

## ✨ Features

*   **Treesitter Support:** Rich syntax highlighting for better code readability.
*   **Semantic Highlighting:** Support for LSP semantic tokens.
*   **Lualine Integration:** Custom theme for `lualine.nvim` included.
*   **Extras:** Color configurations for **WezTerm** and **Ghostty**.
*   **Customizable:** Easily toggle italics, transparency, and specific UI elements.

## 📸 Gallery

### Dark Mode (Nitepal)
| PHP | Telescope |
| --- | --- |
| ![PHP](https://github.com/jascha030/nitepal.nvim/blob/main/img/nitepal_php2.png?raw=true) | ![Telescope](https://github.com/jascha030/nitepal.nvim/blob/main/img/nitepal_telescope.png?raw=true) |

### Light Mode (Litepal)
| Lua | Rust |
| --- | --- |
| ![Lua](https://github.com/jascha030/nitepal.nvim/blob/main/img/litepal_lua.png?raw=true) | ![Rust](https://github.com/jascha030/nitepal.nvim/blob/main/img/litepal_rust.png?raw=true) |

## 📦 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "jascha030/nitepal.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nitepal").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
    })
    vim.cmd.colorscheme("nitepal")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { 
    'jascha030/nitepal.nvim',
    config = function() 
        vim.cmd('colorscheme nitepal') 
    end 
}
```

### [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'jascha030/nitepal.nvim'

" After loading plugins:
colorscheme nitepal
```

## ⚙️ Configuration

You can configure the theme by calling the `setup` function. Here are the defaults:

```lua
require('nitepal').setup({
    -- 'dark' | 'light' | false. 
    -- When false, it respects vim.o.background (recommended for toggling).
    style = false, 

    transparent = {
        background = false, -- Disable editor background (use terminal bg)
        sidebars = false,   -- Transparent sidebar windows (e.g. NvimTree)
        floats = false,     -- Transparent floating windows
        popups = false,     -- Transparent popup windows
    },

    -- Enable contrast for sidebars and floating windows
    contrast = true,

    -- Enable italics for comments and keywords
    italics = true,

    colors = {
        -- Override specific color codes defined in nitepal.palette
        overrides = {}, 
        -- Add new custom colors
        custom = {}, 
    },
})
```

## 🧩 Statusline (Lualine)

A lualine theme is built-in. To use it, simply set the theme in your lualine config:

```lua
require('lualine').setup({
    options = {
        theme = 'nitepal', -- or 'litepal'
    }
})
```

## 🚀 Extras

Configuration files for external terminal emulators are located in the `extras/` directory.

*   **WezTerm:** `extras/wezterm/`
*   **Ghostty:** `extras/ghostty/`

## 🙏 Acknowledgements

*   **[folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim):** The codebase structure and logic heavily inspired this project. It is the gold standard for Lua colorschemes.
*   **[Material Theme UI](https://github.com/mallowigi/material-theme-issues):** The original visual inspiration for the color palette, specifically the Palenight variant.

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/jascha030">Jascha</a>
</p>