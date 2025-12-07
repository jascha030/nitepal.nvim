# GEMINI.MD: AI Collaboration Guide

This document provides essential context for AI models interacting with this project. Adhering to these guidelines will ensure consistency and maintain code quality.

## 1. Project Overview & Purpose

*   **Primary Goal:** This project is a custom **Neovim colorscheme** plugin named `nitepal.nvim`. It is a Lua-based theme inspired by Material Palenight and `tokyonight.nvim`, designed to provide a cohesive visual experience for Neovim and related terminal tools.
*   **Business Domain:** Developer Tools / Personalization (Neovim Ecosystem).

## 2. Core Technologies & Stack

*   **Languages:** Lua (Primary).
*   **Frameworks & Runtimes:** Neovim (LuaJIT).
*   **Dependencies:** No external runtime dependencies, but heavily inspired by the logic of `folke/tokyonight.nvim`.
*   **Package Manager(s):** No strict package manager for development, but users install it via Neovim plugin managers like Packer, Lazy.nvim, or vim-plug.

## 3. Architectural Patterns

*   **Overall Architecture:** Standard Neovim Plugin Architecture. The project is structured to be loaded as a plugin, with the core logic residing in the `lua/` directory and Vimscript compatibility shims in `colors/`.
*   **Directory Structure Philosophy:**
    *   `colors/`: Contains the Vimscript entry points (`nitepal.vim`, `litepal.vim`) that bootstrap the Lua theme.
    *   `lua/nitepal/`: The core source code.
        *   `config.lua`: Handles user configuration and default options.
        *   `theme.lua`: Defines the highlight groups and theme logic.
        *   `palette.lua`: Defines the raw color codes.
        *   `utils/`: Helper functions (e.g., HSLuv color manipulation).
    *   `after/queries/`: Contains Tree-sitter query extensions for language-specific highlighting corrections or enhancements.
    *   `extras/`: Configuration files for external tools like WezTerm and Ghostty to match the Neovim theme.
    *   `lua/lualine/`: Specific theme integration for the `lualine.nvim` statusline plugin.

## 4. Coding Conventions & Style Guide

*   **Formatting:** Defined by `.stylua.toml`.
    *   **Indentation:** 4 spaces.
    *   **Line Width:** 120 characters.
    *   **Quotes:** Auto-prefer single quotes (`'`).
    *   **Line Endings:** Unix (`\n`).
    *   **Call Parentheses:** Always (e.g., `func()` instead of `func`).
*   **Naming Conventions:**
    *   **Directories/Files:** Snake_case (e.g., `config.lua`, `highlights.lua`).
    *   **Functions/Variables:** Snake_case (standard Lua).
    *   **Global/Namespace:** The primary namespace is `nitepal`.
*   **Linting:** `.luarc.json` is present, defining `vim` as a known global to suppress "undefined global" warnings from Lua Language Server.
*   **Error Handling:** Standard Lua error handling (e.g., `pcall`, `error('message')`). Input validation is seen in `init.lua` (checking valid style strings).

## 5. Key Files & Entrypoints

*   **Main Entrypoint(s):**
    *   `colors/nitepal.vim`: The command users run in Vim to load the theme.
    *   `lua/nitepal/init.lua`: The Lua entry point called by the Vimscript file.
*   **Configuration:**
    *   `lua/nitepal/config.lua`: Defines the `defaults` table and merges user config.
    *   `.stylua.toml`: Code formatting rules.
    *   `.luarc.json`: Lua Language Server configuration.

## 6. Development & Testing Workflow

*   **Local Development Environment:**
    *   Clone the repository into a location visible to Neovim (e.g., `~/.local/share/nvim/site/pack/packer/start/` or add via `rtp`).
    *   Reload Neovim or source the Lua files to test changes.
*   **Testing:**
    *   **Type:** Manual/Visual verification.
    *   **Process:** "Eating your own dogfood." The developer uses the theme and tweaks it. No automated test suite (e.g., busted) is currently visible in the file structure.
*   **CI/CD Process:**
    *   No GitHub Actions workflows or GitLab CI configurations are currently detected in the root or `.github` folders. Deployment is likely manual (push to main).

## 7. Specific Instructions for AI Collaboration

*   **Contribution Guidelines:**
    *   Follow the style of `tokyonight.nvim` where applicable.
    *   Ensure any new highlight groups or colors are added to the appropriate files (`theme.lua` for groups, `palette.lua` for colors).
*   **Commit Messages:**
    *   **Style:** Use emojis to denote the type of change.
        *   ✨ `✨` : New features (e.g., adding highlights).
        *   🔧 `🔧` : Tweaks or fixes (e.g., highlight adjustments).
        *   ♻️ `♻️` : Refactoring.
        *   🔥 `🔥` : Removing code/assets.
    *   **Format:** `[Emoji] [Description]` (e.g., "🔧 Tweak completions highlights").
*   **Dependency Management:**
    *   This is a standalone plugin. Avoid introducing external Lua dependencies unless absolutely necessary and they are bundled or standard.
*   **Code Quality:**
    *   Always run `stylua` (or adhere to its rules) before finalizing code.
    *   Respect the `vim` global and do not declare it locally.
