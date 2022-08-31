-- local ctils = pcall(require)

local M = {}

function M.generate(style)
    local colors = require('nitepal.colors').get_colors()
    colors = colors[style] or colors.dark

    local scheme = {}

    if vim.o.background == 'dark' then
        scheme = {
            fg = colors.fg,
            bg = colors.bg,
            bg_dark = colors.bg,
            bg_float = colors.none,
            bg_highlight = '#292e42',
            bg_popup = colors.bg,
            bg_search = colors.blue,
            bg_sidebar = '#24283b',
            bg_statusline = '#1f2335',
            bg_visual = '#364A82',
            black = colors.alt_black,
            border = colors.alt_black,
            blue = '#7aa2f7',
            blue0 = colors.blue,
            blue1 = '#2ac3de',
            blue2 = '#0db9d7',
            blue5 = '#89ddff',
            blue6 = '#B4F9F8',
            blue7 = '#394b70',
            border_highlight = colors.blue,
            comment = '#565f89',
            cyan = colors.bright_blue,
            dark3 = '#545c7e',
            dark5 = '#737aa2',
            diff = {
                add = '#283B4D',
                change = '#272D43',
                delete = '#3F2D3D',
                text = '#394b70',
            },
            error = colors.additional.git_orange,
            fg_dark = '#a9b1d6',
            fg_gutter = '#3b4261',
            fg_sidebar = '#a9b1d6',
            git = {
                add = colors.alt_cyan,
                change = '#6183bb',
                conflict = '#bb7a61',
                delete = '#914c54',
                ignore = '#545c7e',
            },
            gitSigns = {
                add = '#266d6a',
                change = '#536c9e',
                delete = colors.orange,
            },
            green = colors.bright_green,
            green1 = colors.bright_blue,
            green2 = colors.alt_cyan,
            hint = colors.bright_cyan,
            info = colors.cyan,
            magenta = colors.bright_magenta,
            magenta2 = colors.alt_red,
            none = colors.none,
            orange = colors.bright_orange,
            purple = colors.purple,
            red = colors.red,
            red1 = colors.orange,
            teal = colors.red,
            warning = colors.bright_orange,
            yellow = colors.yellow,
            -- warning = '#e0af68',
        }
    else
        -- bg = 'background',
        -- bg_dark = 'background',
        -- yellow = 'red',
        -- purple = 'bright_red',
        -- magenta = 'bright_magenta',
        -- green = 'bright_green',
        -- green1 = 'bright_blue',
        -- blue = 'bright_blue',
        -- teal = 'bright_red',
        -- bg_sidebar = 'none',
        scheme = {
            bg = colors.bg,
            bg_dark = colors.bg,
            bg_float = '#e1e2e7',
            bg_highlight = '#c4c8da',
            bg_popup = '#e9e9ec',
            bg_search = '#7890dd',
            bg_sidebar = '#e1e2e7',
            bg_statusline = '#e9e9ec',
            bg_visual = '#99a7df',
            black = '#e9e9ed',
            -- blue = '#2e7de9',
            blue = colors.bright_blue,
            blue0 = '#7890dd',
            blue1 = '#188092',
            blue2 = '#07879d',
            blue5 = '#006a83',
            blue6 = '#2e5857',
            blue7 = '#92a6d5',
            border = '#e9e9ed',
            border_highlight = '#7890dd',
            comment = '#848cb5',
            cyan = '#007197',
            dark3 = '#8990b3',
            dark5 = '#68709a',
            diff = {
                add = '#aecde6',
                change = '#d6d8e3',
                delete = '#dfccd4',
                text = '#92a6d5',
            },
            error = '#c64343',
            fg = '#3760bf',
            fg_dark = '#6172b0',
            fg_gutter = '#a8aecb',
            fg_sidebar = '#6172b0',
            git = {
                add = colors.alt_cyan,
                change = '#506d9c',
                conflict = '#8a5946',
                delete = '#c47981',
                ignore = '#8990b3',
            },
            gitSigns = {
                add = '#399a96',
                change = '#6482bd',
                delete = colors.orange,
            },
            -- green = colors.bright_green,
            green = colors.dark_green,
            green1 = colors.bright_blue,
            green2 = colors.alt_cyan,
            hint = colors.bright_cyan,
            info = colors.cyan,
            magenta = colors.bright_magenta,
            magenta2 = '#d20065',
            none = colors.none,
            orange = colors.bright_orange,
            purple = colors.dark_red,
            red = colors.red,
            red1 = colors.orange,
            teal = colors.dark_red,
            terminal_black = '#a1a6c5',
            warning = colors.bright_yellow,
            yellow = colors.bright_red,
        }
    end

    return colors, scheme
end

local function set_terminal_colors(colors)
    vim.g.terminal_color_0 = colors.black
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_5 = colors.magenta
    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_7 = colors.white
    vim.g.terminal_color_8 = colors.bright_black
    vim.g.terminal_color_9 = colors.bright_red
    vim.g.terminal_color_10 = colors.bright_green
    vim.g.terminal_color_11 = colors.bright_yellow
    vim.g.terminal_color_12 = colors.bright_blue
    vim.g.terminal_color_13 = colors.bright_magenta
    vim.g.terminal_color_14 = colors.bright_cyan
    vim.g.terminal_color_15 = colors.bright_white
    vim.g.terminal_color_background = colors.bg
    vim.g.terminal_color_foreground = colors.fg
end

local function set_highlight(group, color)
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
    local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
    local sp = color.sp and 'guisp=' .. color.sp or ''

    local hl = 'highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp

    if color.link then
        vim.cmd('highlight! link ' .. group .. ' ' .. color.link)
    else
        vim.cmd(hl)
    end
end

local function set_syntax(syntax)
    for group, colors in pairs(syntax) do
        set_highlight(group, colors)
    end
end

local function setup_hl_colors(c)
    local theme = {}

    theme.base = {
        Comment = { fg = c.comment, style = 'italic' },
        ColorColumn = { bg = c.black },
        Conceal = { fg = c.dark5 },
        Cursor = { fg = c.bg, bg = c.fg },
        lCursor = { fg = c.bg, bg = c.fg },
        CursorIM = { fg = c.bg, bg = c.fg },
        CursorColumn = { bg = c.bg_highlight },
        CursorLine = { bg = c.bg_highlight },
        Directory = { fg = c.blue },
        DiffAdd = { bg = c.diff.add },
        DiffChange = { bg = c.diff.change },
        DiffDelete = { bg = c.diff.delete },
        DiffText = { bg = c.diff.text },
        EndOfBuffer = { fg = c.bg },

        ErrorMsg = { fg = c.error },
        VertSplit = { fg = c.border },
        Folded = { fg = c.blue, bg = c.fg_gutter },
        FoldColumn = { bg = c.bg, fg = c.comment },
        SignColumn = { bg = c.none, fg = c.fg_gutter },
        SignColumnSB = { bg = c.bg_sidebar, fg = c.fg_gutter },
        Substitute = { bg = c.red, fg = c.black },
        LineNr = { fg = c.fg_gutter },
        CursorLineNr = { fg = c.dark5 },
        MatchParen = { fg = c.orange, style = 'bold' },
        ModeMsg = { fg = c.fg_dark, style = 'bold' },
        MsgArea = { fg = c.fg_dark },

        MoreMsg = { fg = c.blue },
        NonText = { fg = c.dark3 },
        Normal = { fg = c.fg, c.none },
        NormalNC = { fg = c.fg, bg = c.none },
        NormalSB = { fg = c.fg_sidebar, bg = c.bg_sidebar },
        NormalFloat = { fg = c.fg, bg = c.bg_float },
        FloatBorder = { fg = c.border_highlight, bg = c.bg_float },
        Pmenu = { bg = c.bg_popup, fg = c.fg },
        -- PmenuSel = { bg = util.darken(c.fg_gutter, 0.8) },
        -- PmenuSbar = { bg = util.lighten(c.bg_popup, 0.95) },
        PmenuThumb = { bg = c.fg_gutter },
        Question = { fg = c.blue },
        QuickFixLine = { bg = c.bg_visual, style = 'bold' },
        Search = { bg = c.bg_search, fg = c.fg },
        IncSearch = { bg = c.orange, fg = c.black },
        SpecialKey = { fg = c.dark3 },
        SpellBad = { sp = c.error, style = 'undercurl' },
        SpellCap = { sp = c.warning, style = 'undercurl' },
        SpellLocal = { sp = c.info, style = 'undercurl' },
        SpellRare = { sp = c.hint, style = 'undercurl' },
        StatusLine = { fg = c.fg_sidebar, bg = c.bg_statusline },
        StatusLineNC = { fg = c.fg_gutter, bg = c.bg_statusline },
        TabLine = { bg = c.bg_statusline, fg = c.fg_gutter },
        TabLineFill = { bg = c.black },
        TabLineSel = { fg = c.black, bg = c.blue },
        Title = { fg = c.blue, style = 'bold' },
        Visual = { bg = c.bg_visual },
        VisualNOS = { bg = c.bg_visual },
        WarningMsg = { fg = c.warning },
        Whitespace = { fg = c.fg_gutter },
        WildMenu = { bg = c.bg_visual },

        Constant = { fg = c.red },
        String = { fg = c.green },
        Character = { fg = c.green },

        Identifier = { fg = c.magenta },
        Function = { fg = c.blue, style = 'italic' },

        Statement = { fg = c.magenta },

        Operator = { fg = c.blue5 },
        Keyword = { fg = c.cyan, style = 'italic' },

        PreProc = { fg = c.cyan },

        Type = { fg = c.blue1 },

        Special = { fg = c.blue1 },

        Underlined = { style = 'underline' },
        Bold = { style = 'bold' },
        Italic = { style = 'italic' },

        Error = { fg = c.error },

        qfLineNr = { fg = c.dark5 },
        qfFileName = { fg = c.blue },

        htmlH1 = { fg = c.magenta, style = 'bold' },
        htmlH2 = { fg = c.blue, style = 'bold' },

        mkdCodeDelimiter = { bg = c.terminal_black, fg = c.fg },
        mkdCodeStart = { fg = c.teal, style = 'bold' },
        mkdCodeEnd = { fg = c.teal, style = 'bold' },

        markdownHeadingDelimiter = { fg = c.orange, style = 'bold' },
        markdownCode = { fg = c.teal },
        markdownCodeBlock = { fg = c.teal },
        markdownH1 = { fg = c.magenta, style = 'bold' },
        markdownH2 = { fg = c.blue, style = 'bold' },
        markdownLinkText = { fg = c.blue, style = 'underline' },

        debugPC = { bg = c.bg_sidebar },
        -- debugBreakpoint = { bg = util.darken(c.info, 0.1), fg = c.info },
        LspReferenceText = { bg = c.fg_gutter },
        LspReferenceRead = { bg = c.fg_gutter },
        LspReferenceWrite = { bg = c.fg_gutter },

        DiagnosticError = { fg = c.error },
        DiagnosticWarn = { fg = c.warning },
        DiagnosticInfo = { fg = c.info },
        DiagnosticHint = { fg = c.hint },
        -- DiagnosticVirtualTextError = { bg = util.darken(c.error, 0.1), fg = c.error },
        -- DiagnosticVirtualTextWarn = { bg = util.darken(c.warning, 0.1), fg = c.warning },
        -- DiagnosticVirtualTextInfo = { bg = util.darken(c.info, 0.1), fg = c.info },
        -- DiagnosticVirtualTextHint = { bg = util.darken(c.hint, 0.1), fg = c.hint },

        DiagnosticUnderlineError = { style = 'undercurl', sp = c.error },
        DiagnosticUnderlineWarn = { style = 'undercurl', sp = c.warning },
        DiagnosticUnderlineInfo = { style = 'undercurl', sp = c.info },
        DiagnosticUnderlineHint = { style = 'undercurl', sp = c.hint },

        LspSignatureActiveParameter = { fg = c.orange },
        LspCodeLens = { fg = c.comment },

        ALEErrorSign = { fg = c.error },
        ALEWarningSign = { fg = c.warning },
    }

    if not vim.diagnostic then
        local severity_map = {
            Error = 'Error',
            Warn = 'Warning',
            Info = 'Information',
            Hint = 'Hint',
        }
        local types = { 'Default', 'VirtualText', 'Underline' }
        for _, type in ipairs(types) do
            for snew, sold in pairs(severity_map) do
                theme.base['LspDiagnostics' .. type .. sold] = {
                    link = 'Diagnostic' .. (type == 'Default' and '' or type) .. snew,
                }
            end
        end
    end

    theme.plugins = {
        TSNote = { fg = c.bg, bg = c.info },
        TSWarning = { fg = c.bg, bg = c.warning },
        TSDanger = { fg = c.bg, bg = c.error },
        TSConstructor = { fg = c.magenta },
        TSField = { fg = c.green1 },
        TSKeyword = { fg = c.purple, style = 'italic' },
        TSKeywordFunction = { fg = c.magenta, style = 'italic' },
        TSLabel = { fg = c.blue },
        TSOperator = { fg = c.blue5 },
        TSParameter = { fg = c.yellow },
        TSProperty = { fg = c.green1 },
        TSPunctDelimiter = { fg = c.blue5 },
        TSPunctBracket = { fg = c.fg_dark },
        TSPunctSpecial = { fg = c.blue5 },
        TSStringRegex = { fg = c.blue6 },
        TSStringEscape = { fg = c.magenta },
        TSVariable = {},
        TSVariableBuiltin = { fg = c.red },
        TSTextReference = { fg = c.teal },

        LspTroubleText = { fg = c.fg_dark },
        LspTroubleCount = { fg = c.magenta, bg = c.fg_gutter },
        LspTroubleNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },

        illuminatedWord = { bg = c.fg_gutter },
        illuminatedCurWord = { bg = c.fg_gutter },

        diffAdded = { fg = c.git.add },
        diffRemoved = { fg = c.git.delete },
        diffChanged = { fg = c.git.change },
        diffOldFile = { fg = c.yellow },
        diffNewFile = { fg = c.orange },
        diffFile = { fg = c.blue },
        diffLine = { fg = c.comment },
        diffIndexLine = { fg = c.magenta },

        NeogitBranch = { fg = c.magenta },
        NeogitRemote = { fg = c.purple },
        NeogitHunkHeader = { bg = c.bg_highlight, fg = c.fg },
        NeogitHunkHeaderHighlight = { bg = c.fg_gutter, fg = c.blue },
        -- NeogitDiffContextHighlight = { bg = util.darken(c.fg_gutter, 0.5), fg = c.fg_dark },
        NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = c.diff.delete },
        NeogitDiffAddHighlight = { fg = c.git.add, bg = c.diff.add },

        GitGutterAdd = { fg = c.gitSigns.add },
        GitGutterChange = { fg = c.gitSigns.change },
        GitGutterDelete = { fg = c.gitSigns.delete },
        GitSignsAdd = { fg = c.gitSigns.add },
        GitSignsChange = { fg = c.gitSigns.change },
        GitSignsDelete = { fg = c.gitSigns.delete },
        TelescopeBorder = { fg = c.border_highlight, bg = c.bg_float },
        TelescopeNormal = { fg = c.fg, bg = c.bg_float },

        NvimTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
        NvimTreeNormalNC = { fg = c.fg_sidebar, bg = c.bg_sidebar },
        NvimTreeRootFolder = { fg = c.blue, style = 'bold' },
        NvimTreeGitDirty = { fg = c.git.change },
        NvimTreeGitNew = { fg = c.git.add },
        NvimTreeGitDeleted = { fg = c.git.delete },
        NvimTreeSpecialFile = { fg = c.purple, style = 'underline' },
        NvimTreeIndentMarker = { fg = c.fg_gutter },
        NvimTreeImageFile = { fg = c.fg_sidebar },
        NvimTreeSymlink = { fg = c.blue },

        FernBranchText = { fg = c.blue },

        GlyphPalette1 = { fg = c.red1 },
        GlyphPalette2 = { fg = c.green },
        GlyphPalette3 = { fg = c.yellow },
        GlyphPalette4 = { fg = c.blue },
        GlyphPalette6 = { fg = c.green1 },
        GlyphPalette7 = { fg = c.fg },
        GlyphPalette9 = { fg = c.red },

        DashboardShortCut = { fg = c.cyan },
        DashboardHeader = { fg = c.blue },
        DashboardCenter = { fg = c.magenta },
        DashboardFooter = { fg = c.yellow, style = 'italic' },

        WhichKey = { fg = c.cyan },
        WhichKeyGroup = { fg = c.blue },
        WhichKeyDesc = { fg = c.magenta },
        WhichKeySeperator = { fg = c.comment },
        WhichKeySeparator = { fg = c.comment },
        WhichKeyFloat = { bg = c.bg_sidebar },
        WhichKeyValue = { fg = c.dark5 },

        DiagnosticWarning = { link = 'DiagnosticWarn' },
        DiagnosticInformation = { link = 'DiagnosticInfo' },

        LspFloatWinNormal = { bg = c.bg_float },
        LspFloatWinBorder = { fg = c.border_highlight },
        LspSagaBorderTitle = { fg = c.cyan },
        LspSagaHoverBorder = { fg = c.blue },
        LspSagaRenameBorder = { fg = c.green },
        LspSagaDefPreviewBorder = { fg = c.green },
        LspSagaCodeActionBorder = { fg = c.blue },
        LspSagaFinderSelection = { fg = c.bg_visual },
        LspSagaCodeActionTitle = { fg = c.blue1 },
        LspSagaCodeActionContent = { fg = c.purple },
        LspSagaSignatureHelpBorder = { fg = c.red },
        ReferencesCount = { fg = c.purple },
        DefinitionCount = { fg = c.purple },
        DefinitionIcon = { fg = c.blue },
        ReferencesIcon = { fg = c.blue },
        TargetWord = { fg = c.cyan },

        healthError = { fg = c.error },
        healthSuccess = { fg = c.green1 },
        healthWarning = { fg = c.warning },

        BufferLineIndicatorSelected = { fg = c.git.change },
        BufferLineFill = { bg = c.black },

        BufferCurrent = { bg = c.fg_gutter, fg = c.fg },
        BufferCurrentIndex = { bg = c.fg_gutter, fg = c.info },
        BufferCurrentMod = { bg = c.fg_gutter, fg = c.warning },
        BufferCurrentSign = { bg = c.none, fg = c.info },
        BufferCurrentTarget = { bg = c.fg_gutter, fg = c.red },
        BufferVisible = { bg = c.bg_statusline, fg = c.fg },
        BufferVisibleIndex = { bg = c.bg_statusline, fg = c.info },
        BufferVisibleMod = { bg = c.bg_statusline, fg = c.warning },
        BufferVisibleSign = { bg = c.bg_statusline, fg = c.info },
        BufferVisibleTarget = { bg = c.bg_statusline, fg = c.red },
        BufferInactive = { bg = c.bg_statusline, fg = c.dark5 },
        BufferInactiveIndex = { bg = c.bg_statusline, fg = c.dark5 },
        -- BufferInactiveMod = { bg = c.bg_statusline, fg = util.darken(c.warning, 0.7) },
        BufferInactiveSign = { bg = c.bg_statusline, fg = c.border_highlight },
        BufferInactiveTarget = { bg = c.bg_statusline, fg = c.red },
        BufferTabpages = { bg = c.bg_statusline, fg = c.none },
        BufferTabpage = { bg = c.bg_statusline, fg = c.border_highlight },

        Sneak = { fg = c.bg_highlight, bg = c.magenta },
        SneakScope = { bg = c.bg_visual },

        HopNextKey = { fg = c.magenta2, style = 'bold' },
        HopNextKey1 = { fg = c.blue2, style = 'bold' },
        -- HopNextKey2 = { fg = util.darken(c.blue2, 0.3) },
        HopUnmatched = { fg = c.dark3 },

        LightspeedGreyWash = { fg = c.dark3 },

        LightspeedLabel = { fg = c.magenta2, style = 'bold,underline' },
        LightspeedLabelDistant = { fg = c.green1, style = 'bold,underline' },
        LightspeedLabelDistantOverlapped = { fg = c.green2, style = 'underline' },
        LightspeedLabelOverlapped = { fg = c.magenta2, style = 'underline' },
        LightspeedMaskedChar = { fg = c.orange },
        LightspeedOneCharMatch = { bg = c.magenta2, fg = c.fg, style = 'bold' },
        LightspeedPendingOpArea = { bg = c.magenta2, fg = c.fg },
        LightspeedShortcut = { bg = c.magenta2, fg = c.fg, style = 'bold,underline' },

        LightspeedUnlabeledMatch = { fg = c.blue2, style = 'bold' },

        CmpDocumentation = { fg = c.fg, bg = c.bg_float },
        CmpDocumentationBorder = { fg = c.border_highlight, bg = c.bg_float },

        CmpItemAbbr = { fg = c.fg, bg = c.none },
        CmpItemAbbrDeprecated = { fg = c.fg_gutter, bg = c.none, style = 'strikethrough' },
        CmpItemAbbrMatch = { fg = c.blue1, bg = c.none },
        CmpItemAbbrMatchFuzzy = { fg = c.blue1, bg = c.none },

        CmpItemKindDefault = { fg = c.fg_dark, bg = c.none },
        CmpItemMenu = { fg = c.comment, bg = c.none },

        CmpItemKindKeyword = { fg = c.cyan, bg = c.none },

        CmpItemKindVariable = { fg = c.magenta, bg = c.none },
        CmpItemKindConstant = { fg = c.magenta, bg = c.none },
        CmpItemKindReference = { fg = c.magenta, bg = c.none },
        CmpItemKindValue = { fg = c.magenta, bg = c.none },

        CmpItemKindFunction = { fg = c.blue, bg = c.none },
        CmpItemKindMethod = { fg = c.blue, bg = c.none },
        CmpItemKindConstructor = { fg = c.blue, bg = c.none },

        CmpItemKindClass = { fg = c.orange, bg = c.none },
        CmpItemKindInterface = { fg = c.orange, bg = c.none },
        CmpItemKindStruct = { fg = c.orange, bg = c.none },
        CmpItemKindEvent = { fg = c.orange, bg = c.none },
        CmpItemKindEnum = { fg = c.orange, bg = c.none },
        CmpItemKindUnit = { fg = c.orange, bg = c.none },

        CmpItemKindModule = { fg = c.yellow, bg = c.none },

        CmpItemKindProperty = { fg = c.green1, bg = c.none },
        CmpItemKindField = { fg = c.green1, bg = c.none },
        CmpItemKindTypeParameter = { fg = c.green1, bg = c.none },
        CmpItemKindEnumMember = { fg = c.green1, bg = c.none },
        CmpItemKindOperator = { fg = c.green1, bg = c.none },
        CmpItemKindSnippet = { fg = c.dark5, bg = c.none },
    }

    return theme
end

function M.init()
    local colors, scheme = M.generate(vim.o.background)
    local theme = setup_hl_colors(scheme)

    set_terminal_colors(colors)
    set_syntax(theme.base)
    set_syntax(theme.plugins)
    -- util.autocmds(theme.config)
end

return M
