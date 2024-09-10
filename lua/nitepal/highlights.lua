local utils = require('nitepal.utils')
local config = require('nitepal.config')

local M = {}

-- @parameter colors Palette
function M.setup_hl_colors(c, colors)
    local function bg(name, color)
        color = color or colors.bg

        if config.options.transparent[name] and config.options.transparent[name] == true then
            return colors.none
        end

        return color
    end

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
        CursorLineNr = { fg = c.fg },
        MatchParen = { fg = c.orange, style = 'bold' },
        ModeMsg = { fg = c.fg_dark, style = 'bold' },
        MsgArea = { fg = c.fg_dark },
        MoreMsg = { fg = c.blue },
        NonText = { fg = c.dark3 },
        Normal = { fg = c.fg, bg = bg('background') },
        NormalNC = { fg = c.fg, bg = bg('background') },
        NormalSB = { fg = c.fg_sidebar, bg = bg('sidebars', c.bg_sidebar) },
        NormalFloat = { fg = c.fg, bg = bg('floats', c.bg_float) },
        FloatBorder = { fg = c.border_highlight, bg = bg('floats', c.bg_float) },
        WinSeparator = { fg = utils.brighten(c.black, 0.05), style = 'bold' },
        -- WinSeparator = { fg = c.fg_gutter },

        Pmenu = { bg = bg('popups', c.bg_popup), fg = c.fg },
        PmenuSel = { bg = c.fg_gutter },
        PmenuSbar = { bg = bg('popups', c.bg_popup) },
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
        TSCSSClassName = { fg = c.purple },
        TabLine = { bg = colors.bg, fg = c.fg_dark },
        TabLineFill = { bg = c.bg },
        TabLineSel = { fg = c.bg_statusline, bg = c.blue },
        Title = { fg = c.blue, style = 'bold' },
        Visual = { bg = c.bg_visual },
        VisualNOS = { bg = c.bg_visual },
        WarningMsg = { fg = c.warning },
        Whitespace = { fg = c.fg_gutter },
        WildMenu = { bg = c.bg_visual },

        Constant = { fg = c.red },
        String = { fg = c.green },
        Character = { fg = c.green },
        Identifier = { fg = c.fg },
        Function = { fg = c.blue1, style = 'italic' },
        Statement = { fg = c.magenta },
        Operator = { fg = c.blue5 },
        Keyword = { fg = c.cyan, style = 'italic' },
        KeywordFunction = { fg = c['function'], style = 'italic,underline' },

        PreProc = { fg = c.magenta },
        Type = { fg = c.blue1 },
        Special = { fg = c.blue1 },
        Underlined = { style = 'underline' },
        Bold = { style = 'bold' },
        Italic = { style = 'italic' },
        Error = { fg = c.error, style = 'underline' },

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
        debugBreakpoint = { bg = utils.darken(c.info, 0.1), fg = c.info },
        LspReferenceText = { bg = c.fg_gutter },
        LspReferenceRead = { bg = c.fg_gutter },
        LspReferenceWrite = { bg = c.fg_gutter },

        DiagnosticError = { fg = c.error },
        DiagnosticWarn = { fg = c.warning },
        DiagnosticInfo = { fg = c.info },
        DiagnosticHint = { fg = c.hint },

        DiagnosticVirtualTextError = { bg = utils.brighten(c.error, -0.3), fg = utils.brighten(c.error, 0.2) },
        DiagnosticVirtualTextWarn = { bg = utils.brighten(c.warning, -0.3), fg = utils.brighten(c.warning, 0.2) },
        DiagnosticVirtualTextInfo = { bg = utils.brighten(c.info, -0.3), fg = utils.brighten(c.info, 0.2) },
        DiagnosticVirtualTextHint = { bg = utils.brighten(c.hint, -0.3), fg = utils.brighten(c.hint, 0.2) },

        DiagnosticUnderlineError = { style = 'undercurl', sp = c.error },
        DiagnosticUnderlineWarn = { style = 'undercurl', sp = c.warning },
        DiagnosticUnderlineInfo = { style = 'undercurl', sp = c.info },
        DiagnosticUnderlineHint = { style = 'undercurl', sp = c.hint },

        LspSignatureActiveParameter = { fg = colors.bright_purple },
        LspCodeLens = { fg = c.comment },

        ['@text.note'] = { fg = c.bg, bg = c.info },
        ['@text.warning'] = { fg = c.bg, bg = c.warning },
        ['@text.danger'] = { fg = c.bg, bg = c.error },
        ['@class.declaration'] = { fg = colors.bright_yellow },
        ['@interface.declaration'] = { fg = c.green, style = 'italic' },
        ['@method'] = { fg = c.blue1 },
        ['@keyword'] = { fg = c.keyword, style = 'italic' },
        ['@object.var'] = { fg = c.fg },
        ['@constant'] = { link = 'Constant' },
        ['@constant.builtin'] = { link = '@constant' },
        ['@constant.macro'] = { link = '@constant' },
        ['@constant.class'] = { link = '@keyword' },
        ['@operator'] = { fg = c.blue5 },
        ['@field'] = { fg = c.green1 },
        ['@label'] = { fg = c.blue },
        ['@property'] = { fg = c.fg },
        ['@parameter'] = { fg = colors.red },
        ['@parameter.builtin'] = { link = '@parameter' },
        ['@parameter.operator'] = { fg = c.red, style = 'bold' },
        ['@parameter.reference'] = { link = '@parameter' },
        ['@parameter.name.php'] = { fg = colors.alt_blue },
        ['@selector.tag'] = { link = '@constant' },
        ['@selector.id'] = { link = 'TSSelector' }, -- TODO: find out
        ['@keyword.scope'] = { fg = colors.red, style = 'italic' },
        ['@keyword.function'] = { link = 'KeywordFunction' },
        ['@keyword.operator'] = { fg = c.fg, style = 'bold' },
        ['@keyword.return'] = { link = '@keyword' },
        ['@conditional.keyword'] = { link = '@keyword' },
        ['@conditional.operator'] = { link = '@variable' },
        ['@conditional'] = { link = '@keyword' },
        ['@variable'] = { fg = c.fg },
        ['@variable.bash'] = { link = '@constant' },
        ['@boolean'] = { fg = colors.red },
        ['@variable.builtin'] = { link = '@variable' },
        ['@variable.operator'] = { fg = c.fg, style = 'bold' },
        ['@type'] = { fg = c.fg },
        ['@namespace'] = { link = '@type' },
        ['@reference.scope'] = { fg = c.green },
        ['@type.builtin'] = { fg = c.magenta, style = 'italic' },
        ['@function'] = { fg = c.blue1 },
        ['@function.builtin'] = { link = '@type.builtin' },
        ['@scope.relative'] = { fg = colors.purple },
        ['@qualifier'] = { fg = colors.purple },
        ['@punctuation.delimiter'] = { fg = c.blue5 },
        ['@punctuation.bracket'] = { fg = c.red },
        ['@punctuation.bracket.php'] = { fg = c.red, style = 'italic' },
        ['@punctuation.special'] = { fg = c.red },
        ['@string'] = { fg = c.green },
        ['@string.regex'] = { fg = c.blue6 },
        ['@string.escape'] = { fg = c.magenta },
        ['@text.reference'] = { fg = c.teal },
        ['@debug'] = { link = 'TSDebug' },
        ['@define'] = { link = 'TSDefine' },
        ['@error'] = { link = 'TSError' },
        ['@exception'] = { link = 'TSException' },
        ['@method.call'] = { link = '@method' },
        ['@module.php'] = { link = '@type' },
        ['@none'] = { link = 'TSNone' },
        ['@number'] = { fg = colors.red },
        ['@preproc'] = { link = 'TSPreProc' },
        ['@tag'] = { link = '@keyword' },
        ['@attribute'] = { link = '@tag' },
        ['@tag.attribute'] = { link = '@tag' },
        ['@todo'] = { fg = utils.brighten(c.orange, 0.5) },
        ['@type.qualifier'] = { link = '@keyword' },
        ['@title'] = { link = 'Title' },
        ['@lsp.type.class'] = { link = '@type' },
        ['@lsp.type.comment'] = { fg = c.comment },
        ['@lsp.type.function'] = { link = '@function' },
        ['@lsp.type.method'] = { link = '@method' },
        ['@lsp.type.namespace'] = { link = '@namespace' },
        ['@lsp.type.parameter'] = { link = '@parameter' },
        ['@lsp.type.property'] = { link = '@property' },
        ['@lsp.type.type'] = { link = '@type' },
        ['@lsp.type.typeParameter'] = { link = '@type' },
        ['@lsp.type.variable'] = { link = '@variable' },
        -- ['@lsp.type.variable.lua'] = { link = '@constant' },

        -- Lua
        ['@function.builtin.lua'] = { link = '@function.builtin ' },
        ['@lsp.typemod.function.defaultLibrary.lua'] = { link = '@function.builtin' },
        ['@lsp.typemod.variable.global.lua'] = { link = '@constant' },
        -- Interface declaration style for built-in types and type parameters (within the `<` and `>`) for generic Types.
        ['@lsp.type.interface.typescript'] = { link = '@interface.declaration' },
        ['@lsp.type.type.typescript'] = { link = '@interface.declaration' },
        ['@lsp.type.typeParameter.typescript'] = { fg = colors.bright_yellow },
        ['@lsp.typemod.type.defaultLibrary.typescript'] = { link = '@interface.declaration' },
        ['@lsp.typemod.typeParameter.declaration.typescript'] = { link = '@lsp.type.typeParameter.typescript' },
        ['@lsp.typemod.class.defaultLibrary.typescript'] = { link = '@class.declaration' },

        -- ['@lsp.type.property.lua'] = { link = '@field' },
        -- ['@lsp.type.decorator'] = {},
        -- ['@lsp.type.enum'] = {},
        -- ['@lsp.type.enumMember'] = {},
        -- ['@lsp.type.interface'] = {},
        -- ['@lsp.type.macro'] = {},
        -- ['@lsp.type.struct'] = {},
        -- ['@repeat'] = { link = 'TSRepeat' },
        -- ['@storageclass'] = { link = 'TSStorageClass' },
        -- ['@symbol'] = { link = 'TSSymbol' },
        -- ['@tag.delimiter'] = { link = 'TSTagDelimiter' },
        -- ['@text'] = { link = 'TSText' },
        -- ['@text.strong'] = { link = 'TSStrong' },
        -- ['@text.emphasis'] = { link = 'TSEmphasis' },
        -- ['@text.underline'] = { link = 'TSUnderline' },
        -- ['@text.environment'] = { link = 'TSEnvironment' },
        -- ['@text.environment.name'] = { link = 'TSEnvironmentName' },
        -- ['@type.definition'] = { link = 'TSTypeDefinition' },
        zshCommands = { link = '@function.builtin' },
        zshDeref = { link = '@constant' },
        zshSubst = { link = '@constant' },
        zshSubstQuoted = { link = '@constant' },
        zshSubstDelim = { link = '@function.builtin' },
        zshMathSubst = { link = '@constant' },
        zshBrackets = { link = '@constant' },
        zshKeyword = { link = '@function.builtin' },
        zshKSHFunction = { link = '@function' },
    }

    if not vim.diagnostic then
        local severity_map = { Error = 'Error', Warn = 'Warning', Info = 'Information', Hint = 'Hint' }
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
        ALEErrorSign = { fg = c.error },
        ALEWarningSign = { fg = c.warning },

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
        -- NeogitDiffContextHighlight = { bg = utils.darken(c.fg_gutter, 0.5), fg = c.fg_dark },
        NeogitDiffDeleteHighlight = { fg = c.git.delete, bg = c.diff.delete },
        NeogitDiffAddHighlight = { fg = c.git.add, bg = c.diff.add },

        NeoTreeFloatBorder = { fg = c.fg_sidebar, bg = bg('sidebars', c.bg_sidebar) },
        NeoTreeDotFile = { fg = c.dark5, bg = bg('sidebars', c.bg_sidebar) },
        NeoTreeCursorLine = { link = 'CursorLine' },
        -- NeoTreeBufferNumber = {},
        -- NeoTreeDimText = {},
        -- NeoTreeDirectoryIcon = {},
        -- NeoTreeDirectoryName = {},
        -- NeoTreeDotfile = {},
        -- NeoTreeFadeText1 = {},
        -- NeoTreeFadeText2 = {},
        -- NeoTreeFileIcon = {},
        -- NeoTreeFileName = {},
        -- NeoTreeFileNameOpened = {},
        -- NeoTreeFilterTerm = {},
        -- NeoTreeFloatNormal = {},
        -- NeoTreeFloatTitle = {},
        NeoTreeGitAdded = { fg = c.git.add },
        -- NeoTreeGitConflict = {},
        NeoTreeGitDeleted = { fg = c.git.delete },
        -- NeoTreeGitIgnored = {},
        NeoTreeGitModified = { fg = c.git.change },
        -- NeoTreeGitRenamed = {},
        -- NeoTreeGitStaged = {},
        -- NeoTreeGitUntracked = {},
        -- NeoTreeGitUnstaged = {},
        -- NeoTreeHiddenByName = {},
        -- NeoTreeMessage = {},
        -- NeoTreeModified = {},
        NeoTreeNormal = { link = 'NvimTreeNormal' },
        NeoTreeNormalNC = { link = 'NvimTreeNormalNC' },
        NeoTreeSignColumn = { link = 'SignColumn' },
        -- NeoTreeStatusLine = {},
        -- NeoTreeStatusLineNC = {},
        -- NeoTreeTabActive = {},
        NeoTreeTabInactive = { bg = utils.darken(c.bg_sidebar, 0.5), fg = c.dark5 },
        NeoTreeTabSeparatorActive = { link = 'Bord' },
        NeoTreeTabSeparatorInactive = {},
        NeoTreeVertSplit = { fg = c.red1 },
        NeoTreeWinSeparator = { fg = c.red1, bg = c.bg_sidebar },
        -- NeoTreeEndOfBuffer = {},
        NeoTreeRootName = { link = 'NvimTreeRootFolder' },
        NeoTreeSymbolicLinkTarget = { link = 'NvimTreeIndentMarker' },
        -- NeoTreeTitleBar = {},
        NeoTreeIndentMarker = { link = 'NvimTreeIndentMarker' },
        -- NeoTreeExpander = {},
        -- NeoTreeWindowsHidden = {},
        -- NeoTreePreview = {},

        GitGutterAdd = { fg = c.gitSigns.add },
        GitGutterChange = { fg = c.gitSigns.change },
        GitGutterDelete = { fg = c.gitSigns.delete },
        GitSignsAdd = { fg = c.gitSigns.add },
        GitSignsChange = { fg = c.gitSigns.change },
        GitSignsDelete = { fg = c.gitSigns.delete },
        TelescopeBorder = { fg = c.border_highlight, bg = bg('floats', c.bg_float) },
        TelescopeNormal = { fg = c.fg, bg = bg('floats', c.bg_float) },

        NvimTreeNormal = { fg = c.fg_sidebar, bg = bg('sidebars', c.bg_sidebar) },
        NvimTreeNormalNC = { fg = c.fg_sidebar, bg = bg('sidebars', c.bg_sidebar) },
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

        LspFloatWinNormal = { bg = bg('floats', c.bg_foat) },
        LspFloatWinBorder = { fg = c.border_highlight },

        LspInlayHint = { fg = c.comment, bg = c.bg_highlight, style = 'italic' },

        LspInfoBorder = { link = 'FloatBorder' },
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
        BufferInactiveMod = { bg = c.bg_statusline, fg = utils.darken(c.warning, 0.7) },
        BufferInactiveSign = { bg = c.bg_statusline, fg = c.border_highlight },
        BufferInactiveTarget = { bg = c.bg_statusline, fg = c.red },
        BufferTabpages = { bg = c.bg_statusline, fg = c.none },
        BufferTabpage = { bg = c.bg_statusline, fg = c.border_highlight },

        Sneak = { fg = c.bg_highlight, bg = c.magenta },
        SneakScope = { bg = c.bg_visual },

        -- Hop
        HopNextKey = { fg = c.red, style = 'bold' },
        HopNextKey1 = { fg = c.magenta2, style = 'bold' },
        HopNextKey2 = { fg = utils.darken(c.blue2, 0.3) },
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

        FineCmdlineNormal = { link = 'NormalFloat' },
        FineFloatBorder = { link = 'FloatBorder' },

        CmpDocumentation = { fg = c.fg, bg = bg('floats', c.bg_foat) },
        CmpDocumentationBorder = { fg = c.border_highlight, bg = bg('floats', c.bg_foat) },
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

        -- Fidget
        FidgetTitle = { fg = c.red, bg = c.none },
        FidgetTask = { fg = c.fg, bg = c.bg },

        -- Devicons
        DevIconRedDef = { fg = c.red },
        DevIconOrangeDef = { fg = c.orange },
        DevIconYellowDef = { fg = c.yellow },
        DevIconGreenDef = { fg = c.green },
        DevIconPurpleDef = { fg = c.purple },
        DevIconBlueDef = { fg = c.blue },
        DevIconMagentaDef = { fg = c.magenta },
        DevIconCyanDef = { fg = c.cyan },
        DevIconWhiteDef = { fg = c.fg },
        DevIconBlackDef = { fg = c.black },
        DevIconRed1 = { fg = c.red1 },

        DevIconLockfile = { fg = colors.white },
        DevIconPackageLockJson = { link = 'DevIconLockFile' },
        DevIconLock = { link = 'DevIconLockFile' },
        DevIconMixLock = { link = 'DevIconLockFile' },

        DevIconIgnoreFile = { fg = colors.black },
        DevIconStyluaIgnore = { link = 'DevIconIgnoreFile' },
        DevIconGlobalGitIgnore = { link = 'DevIconIgnoreFile' },
        DevIconNPMIgnore = { link = 'DevIconIgnoreFile' },
        DevIconGitIgnore = { link = 'DevIconIgnoreFile' },

        DevIconNPM = { fg = '#e8274b' },
        DevIconPackageJson = { link = 'DevIconNPM' },
        DevIconNPMrc = { link = 'DevIconNPM' },
        DevIconNvmRc = { fg = c.blue },

        DevIconPy = { fg = '#3572A5' },
        DevIconC = { fg = '#599eff' },
        DevIconDart = { fg = '#03589C' },
        DevIconCobol = { fg = '#005ca5' },
        DevIconTcl = { fg = '#1e5cb3' },
        DevIconCPlusPlus = { fg = '#f34b7d' },

        DevIconYml = { fg = colors.bright_yellow },
        DevIconYaml = { fg = colors.bright_yellow },

        DevIconIni = { fg = colors.purple }, -- '#6d8086'

        DevIconGodotProject = { fg = '#6d8086' },
        DevIconGDScript = { fg = '#6d8086' },

        DevIconRb = { fg = c.red1 },
        DevIconRakefile = { fg = c.gitSigns.delete },
        DevIconRake = { fg = c.gitSigns.delete },
        DevIconConfigRu = { fg = c.gitSigns.delete },
        DevIconGemfile = { fg = c.gitSigns.delete },
        DevIconGemspec = { fg = c.gitSigns.delete },
        DevIconErb = { fg = c.gitSigns.delete },
        DevIconBrewfile = { link = 'DevIconRb' },
        DevIconScala = { fg = '#cc3e44' },
        DevIconRs = { fg = '#dea584' },
        DevIconMakefile = { fg = '#6d8086' },
        DevIconJava = { fg = '#cc3e44' },
        DevIconPpt = { fg = '#cb4a32' },

        -- { fg = '#E8274B' },

        DevIconDockerfile = { fg = '#384d54' },
        DevIconDb = { fg = '#dad8d8' },
        DevIconSql = { fg = '#dad8d8' },
        DevIconToml = { fg = '#6d8086' },
        DevIconGitConfig = { fg = '#41535b' },
        DevIconGitAttributes = { fg = '#41535b' },

        DevIconSh = { fg = colors.magenta },
        DevIconZsh = { link = 'DevIconSh' },
        DevIconFish = { link = 'DevIconSh' },

        DevIconConf = { fg = '#6d8086' },
        DevIconDefault = { fg = '#6d8086' },
        DevIconPromptPs1 = { fg = c.red1 },
        DevIconCsh = { fg = '#4d5a5e' },
        DevIconAwk = { fg = '#4d5a5e' },
        DevIconRlib = { fg = '#dea584' },
        DevIconXls = { fg = '#207245' },
        DevIconPdf = { fg = '#b30b00' },
        DevIconDsStore = { fg = '#41535b' },
        DevIconCMake = { fg = '#6d8086' },
        DevIconPrisma = { fg = colors.bright_white },
        DevIconPrompt = { fg = colors.red },
        DevIconLog = { fg = colors.bright_white },
        DevIconOpenTypeFont = { fg = '#ECECEC' },
        DevIconImportConfiguration = { fg = '#ECECEC' },
        DevIconNix = { fg = '#7ebae4' },
        DevIconTex = { fg = '#3D6117' },
        DevIconGitCommit = { fg = '#41535b' },
        DevIconPackedResource = { fg = '#6d8086' },
        DevIconDiff = { fg = '#41535b' },
        DevIconKsh = { fg = '#4d5a5e' },
        DevIconDump = { fg = '#dad8d8' },
        DevIconGulpfile = { fg = '#cc3e44' },
        DevIconGitModules = { fg = '#41535b' },
        DevIconCrystal = { fg = colors.alt_black },
        DevIconFennel = { fg = '#fff3d7' },
        DevIconCMakeLists = { fg = '#6d8086' },
        DevIconHtml = { fg = c.orange },
        DevIconMarkdown = { fg = c.orange },
        DevIconLua = { fg = '#79b8ff' },
        DevIconVue = { fg = colors.alt_green },
        DevIconJsx = { fg = colors.alt_cyan },
        DevIconWebp = { fg = c.purple },
        DevIconJs = { fg = colors.bright_green },
        DevIconRss = { fg = c.orange },
        DevIconCp = { fg = colors.alt_cyan },
        DevIconTsx = { fg = colors.alt_cyan },
        DevIconGitLogo = { fg = c.orange },
        DevIconSwift = { fg = c.orange },
        DevIconPyo = { fg = colors.alt_cyan },
        DevIconPyd = { fg = colors.alt_cyan },
        DevIconPyc = { fg = colors.alt_cyan },
        DevIconPng = { fg = c.purple },
        DevIconPl = { fg = colors.alt_cyan },
        DevIconNodeModules = { fg = c.red },
        DevIconMdx = { fg = c.orange },
        DevIconMd = { fg = c.orange },
        DevIconTs = { fg = colors.alt_cyan },
        DevIconLicense = { fg = colors.bright_green },
        DevIconCss = { fg = colors.magenta },
        DevIconJpg = { fg = c.purple },
        DevIconJpeg = { fg = c.purple },
        DevIconIco = { fg = colors.bright_green },
        DevIconVimrc = { fg = colors.green },
        DevIconPhp = { fg = c.purple },
        DevIconGvimrc = { fg = colors.green },
        DevIconR = { fg = colors.green },
        DevIconBash = { fg = colors.green },
        DevIconSvg = { fg = colors.yellow },
        DevIconGo = { fg = colors.alt_cyan },
        DevIconZshrc = { fg = c.magenta },
        DevIconCpp = { fg = colors.alt_cyan },
        DevIconHtm = { fg = c.orange },
        DevIconJson = { fg = colors.bright_yellow },
        DevIconVim = { fg = colors.green },
        DevIconTerminal = { fg = colors.green },
        DevIconEx = { fg = c.purple },
        DevIconSvelte = { fg = colors.alt_red },
        DevIconFsscript = { fg = colors.alt_cyan },
        DevIconFsi = { fg = colors.alt_cyan },
        DevIconKotlin = { fg = c.orange },
        DevIconClojureDart = { fg = colors.alt_cyan },
        DevIconBmp = { fg = c.purple },
        DevIconClojureJS = { fg = colors.alt_cyan },
        DevIconProlog = { fg = colors.bright_yellow },
        DevIconClojureC = { fg = colors.alt_green },
        DevIconEjs = { fg = colors.bright_green },
        DevIconSuo = { fg = c.magenta },
        DevIconSln = { fg = c.magenta },
        DevIconSig = { fg = c.orange },
        DevIconRmd = { fg = colors.alt_cyan },
        DevIconProcfile = { fg = c.purple },
        DevIconDropbox = { fg = colors.alt_blue },
        DevIconRproj = { fg = colors.green },
        DevIconTextResource = { fg = colors.bright_green },
        DevIconTextScene = { fg = c.purple },
        DevIconFsharp = { fg = colors.alt_cyan },
        DevIconPsd = { fg = colors.alt_cyan },
        DevIconPsb = { fg = colors.alt_cyan },
        DevIconWebpack = { fg = colors.alt_cyan },
        DevIconClojure = { fg = colors.alt_green },
        DevIconOPUS = { fg = c.orange },
        DevIconDoc = { fg = colors.blue },
        DevIconDesktopEntry = { fg = colors.magenta },
        DevIconCsv = { fg = colors.green },
        DevIconSystemVerilog = { fg = colors.green },
        DevIconCson = { fg = colors.bright_green },
        DevIconHeex = { fg = c.purple },
        DevIconCoffee = { fg = colors.bright_green },
        DevIconConfiguration = { fg = colors.alt_white },
        DevIconNim = { fg = colors.yellow },
        DevIconMustache = { fg = c.orange },
        DevIconHs = { fg = c.purple },
        DevIconFs = { fg = colors.alt_cyan },
        DevIconMaterial = { fg = colors.magenta },
        DevIconLess = { fg = colors.magenta },
        DevIconLeex = { fg = c.purple },
        DevIconEpp = { fg = c.bright_yellow },
        DevIconDrools = { fg = colors.bright_red },
        DevIconTor = { fg = colors.alt_cyan },
        DevIconBat = { fg = colors.alt_green },
        DevIconHbs = { fg = c.orange },
        DevIconHaml = { fg = c.fg },
        DevIconH = { fg = c.purple },
        DevIconHh = { fg = c.purple },
        DevIconVHDL = { fg = colors.green },
        DevIconBinaryGLTF = { fg = colors.yellow },
        DevIconTxt = { fg = colors.green },
        DevIconGif = { fg = c.purple },
        DevIconErl = { fg = colors.dark_red },
        DevIconTwig = { fg = colors.alt_green },
        DevIconFsx = { fg = colors.alt_cyan },
        DevIconEnv = { fg = c.yellow },
        DevIconMjs = { fg = c.yellow },
        DevIconAi = { fg = colors.bright_green },
        DevIconXul = { fg = c.orange },
        DevIconCs = { fg = colors.dark_green },
        DevIconXml = { fg = c.orange },
        DevIconElm = { fg = colors.alt_cyan },
        DevIconXcPlayground = { fg = c.orange },
        DevIconSolidity = { fg = colors.alt_cyan },
        DevIconVerilog = { fg = colors.green },
        DevIconMli = { fg = c.orange },
        DevIconKotlinScript = { fg = c.orange },
        DevIconWebmanifest = { fg = colors.yellow },
        DevIconVagrantfile = { fg = colors.alt_blue },
        DevIconZshenv = { fg = c.magenta },
        DevIconZshprofile = { fg = colors.magenta },
        DevIconSettingsJson = { fg = c.magenta },
        DevIconLhs = { fg = c.purple },
        DevIconGitlabCI = { fg = c.error },
        DevIconSml = { fg = c.orange },
        DevIconHpp = { fg = c.purple },
        DevIconBashProfile = { fg = colors.green },
        DevIconSlim = { fg = c.orange },
        DevIconBabelrc = { fg = colors.alt_green },
        DevIconHrl = { fg = colors.dark_red },
        DevIconScss = { fg = colors.alt_red },
        DevIconSass = { fg = '#f55385' },

        DevIconBashrc = { fg = colors.green },
        DevIconZig = { fg = colors.bright_yellow },
        DevIconPm = { fg = colors.alt_cyan },
        DevIconFavicon = { fg = colors.bright_green },
        DevIconMint = { fg = colors.bright_cyan },
        DevIconMl = { fg = c.orange },
        DevIconExs = { fg = c.purple },
        DevIconMotoko = { fg = colors.bright_purple },
        DevIconEdn = { fg = colors.alt_cyan },
        DevIconD = { fg = colors.dark_green },
        DevIconHxx = { fg = c.purple },
        DevIconEex = { fg = c.purple },
        DevIconStyl = { fg = colors.alt_green },
        DevIconJl = { fg = c.purple },
        DevIconGruntfile = { fg = c.orange },
        DevIconPp = { fg = c.bright_yellow },
        DevIconCxx = { fg = colors.alt_cyan },
        DevIconMyCnf = { fg = c.blue },
        DevIconAntigenrc = { fg = c.yellow },
        DevIconInit = { fg = c.red },
        DevIconHushlogin = { fg = colors.black },
        DevIconEditorConfig = { fg = c.yellow },
        DevIconDotfileGitConfig = { fg = c.red1 },
        DevIconDefaultGitConfig = { fg = c.red1 },
        DevIconInitLua = { fg = c.magenta },
        DevIconFzf = { fg = c.red },
        DevIconAutols = { fg = c.cyan },
        DevIconMacOs = { fg = c.magenta },
        DevIconAlias = { fg = c.yellow },
        DevIconStarship = { fg = c.magenta },
        DevIconREADME = { fg = c.red },
        DevIconZshOverrides = { fg = c.purple },
    }

    return theme
end

return M
