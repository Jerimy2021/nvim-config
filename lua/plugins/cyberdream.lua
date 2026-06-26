require("cyberdream").setup({
    transparent = true,
    italic_comments = true,
    terminal_colors = true,
    theme = {
        variant = "default",
        highlights = {
            Normal = { bg = "NONE" },
            NormalNC = { bg = "NONE" },
        },
    },
})

vim.cmd("colorscheme cyberdream")

-- =============================================================================
-- PALETA "DARK CYBERPUNK" PARA WALLPAPER CLARO + TRANSPARENCIA
-- =============================================================================
-- DIAGNÓSTICO: Con Kitty opacity = 0.32 y wallpaper claro/medio, el fondo
-- efectivo del editor es ~70% gris claro. Por eso los colores neón claros
-- (verde lima, cyan claro, blanco) desaparecen — no hay contraste.
--
-- ESTRATEGIA: Colores OSCUROS y MUY saturados para el código. Mantienen el
-- espíritu cyberpunk (magenta profundo, púrpura, índigo) pero con suficiente
-- contraste contra gris claro. Para ventanas flotantes (which-key, telescope)
-- se fuerza un fondo oscuro sólido para que ahí sí brillen los neones.
-- =============================================================================

local palette = {
    -- Colores principales (oscuros + saturados, para fondo claro)
    magenta    = "#c2185b",
    indigo     = "#1a237e",
    purple     = "#4a148c",
    teal       = "#00695c",
    forest     = "#1b5e20",
    crimson    = "#b71c1c",
    burnt      = "#bf360c",
    wine       = "#880e4f",
    deep_blue  = "#0d47a1",
    black      = "#000000",
    slate      = "#455a64",

    -- Acentos UI
    hot_pink   = "#ff1744",
    amber      = "#ff6f00",
    yellow_hi  = "#fdd835",

    -- Líneas y separadores
    line_nr    = "#9e9e9e",
    border     = "#37474f",

    -- Fondos de ventanas FLOTANTES
    float_bg     = "#0a0a14",
    float_bg_alt = "#13131f",
    float_border = "#7c4dff",

    -- Neones SOLO para uso dentro de flotantes (fondo oscuro)
    neon_pink   = "#ff2a6d",
    neon_cyan   = "#05d9e8",
    neon_green  = "#00ff9f",
    neon_blue   = "#7aa2f7",
    neon_purple = "#bd93f9",
    neon_orange = "#ffb86c",
    neon_white  = "#e2e8f0",
}

local highlights = {
    -- 1. INTERFAZ BASE
    Normal         = { fg = palette.black, bg = "NONE" },
    NormalNC       = { bg = "NONE" },
    SignColumn     = { bg = "NONE" },
    LineNr         = { fg = palette.line_nr, bg = "NONE" },
    CursorLineNr   = { fg = palette.hot_pink, bold = true, bg = "NONE" },
    CursorLine     = { bg = "NONE" },
    Visual         = { bg = "#7c4dff", fg = "#ffffff", bold = true },
    Search         = { fg = palette.black, bg = palette.yellow_hi, bold = true },
    IncSearch      = { fg = "#ffffff", bg = palette.amber, bold = true },
    VertSplit      = { fg = palette.border, bg = "NONE" },
    WinSeparator   = { fg = palette.border, bg = "NONE" },
    EndOfBuffer    = { fg = "#e0e0e0", bg = "NONE" },
    NonText        = { fg = "#bdbdbd" },
    Whitespace     = { fg = "#cfd8dc" },

    -- 2. KEYWORDS (Magenta oscuro saturado)
    Keyword                    = { fg = palette.magenta, bold = true, italic = true },
    Statement                  = { fg = palette.magenta, bold = true, italic = true },
    Conditional                = { fg = palette.magenta, bold = true, italic = true },
    Repeat                     = { fg = palette.magenta, bold = true, italic = true },
    Exception                  = { fg = palette.magenta, bold = true, italic = true },
    Include                    = { fg = palette.magenta, bold = true, italic = true },
    StorageClass               = { fg = palette.magenta, bold = true, italic = true },
    ["@keyword"]               = { fg = palette.magenta, bold = true, italic = true },
    ["@keyword.modifier"]      = { fg = palette.magenta, bold = true, italic = true },
    ["@keyword.coroutine"]     = { fg = palette.magenta, bold = true, italic = true },
    ["@keyword.exception"]     = { fg = palette.magenta, bold = true, italic = true },
    ["@keyword.return"]        = { fg = palette.magenta, bold = true, italic = true },
    ["@keyword.import"]        = { fg = palette.magenta, bold = true, italic = true },
    ["@keyword.conditional"]   = { fg = palette.magenta, bold = true, italic = true },
    ["@keyword.repeat"]        = { fg = palette.magenta, bold = true, italic = true },
    ["@keyword.operator"]      = { fg = palette.magenta, bold = true },

    -- 3. VARIABLES (Teal oscuro)
    ["@variable"]              = { fg = palette.teal, bold = true },
    ["@variable.member"]       = { fg = palette.burnt, bold = true },
    ["@variable.parameter"]    = { fg = palette.deep_blue, italic = true },
    ["@variable.builtin"]      = { fg = palette.wine, italic = true, bold = true },
    ["@field"]                 = { fg = palette.burnt, bold = true },
    ["@property"]              = { fg = palette.burnt, italic = true, bold = true },
    Identifier                 = { fg = palette.teal },

    -- 4. STRINGS (Verde bosque saturado)
    String                     = { fg = palette.forest, italic = true, bold = true },
    ["@string"]                = { fg = palette.forest, italic = true, bold = true },
    ["@string.escape"]         = { fg = palette.amber, bold = true },
    ["@string.special"]        = { fg = palette.amber, bold = true },
    Character                  = { fg = palette.forest, bold = true },

    -- 5. FUNCIONES (Índigo oscuro)
    Function                   = { fg = palette.indigo, bold = true },
    ["@function"]              = { fg = palette.indigo, bold = true },
    ["@function.call"]         = { fg = palette.indigo, bold = true },
    ["@function.builtin"]      = { fg = palette.indigo, bold = true, italic = true },
    ["@method"]                = { fg = palette.indigo, bold = true },
    ["@method.call"]           = { fg = palette.indigo, bold = true },

    -- 6. TIPOS, CLASES, NAMESPACES (Púrpura profundo)
    Type                       = { fg = palette.purple, bold = true },
    ["@type"]                  = { fg = palette.purple, bold = true },
    ["@type.builtin"]          = { fg = palette.purple, bold = true, italic = true },
    ["@type.qualifier"]        = { fg = palette.magenta, italic = true },
    ["@constructor"]           = { fg = palette.purple, bold = true },
    ["@module"]                = { fg = palette.wine, bold = true },
    ["@parameter"]             = { fg = palette.deep_blue, italic = true },

    -- 7. BOOLEANOS Y NÚMEROS (Carmesí)
    ["@boolean"]               = { fg = palette.crimson, bold = true },
    ["@number"]                = { fg = palette.crimson, bold = true },
    ["@number.float"]          = { fg = palette.crimson, bold = true },
    Boolean                    = { fg = palette.crimson, bold = true },
    Number                     = { fg = palette.crimson, bold = true },
    Float                      = { fg = palette.crimson, bold = true },

    -- 8. OPERADORES Y PUNTUACIÓN (Negro absoluto)
    Operator                   = { fg = palette.black, bold = true },
    ["@operator"]              = { fg = palette.black, bold = true },
    ["@punctuation.bracket"]   = { fg = palette.black, bold = true },
    ["@punctuation.delimiter"] = { fg = palette.black, bold = true },
    ["@punctuation.special"]   = { fg = palette.black, bold = true },
    Delimiter                  = { fg = palette.black, bold = true },
    Special                    = { fg = palette.burnt, bold = true },

    -- 9. COMENTARIOS Y GIT BLAME INLINE
    Comment                    = { fg = palette.slate, italic = true, bold = true },
    ["@comment"]               = { fg = palette.slate, italic = true, bold = true },
    ["@comment.todo"]          = { fg = "#ffffff", bg = palette.amber, bold = true },
    ["@comment.note"]          = { fg = "#ffffff", bg = palette.indigo, bold = true },
    ["@comment.warning"]       = { fg = "#ffffff", bg = palette.burnt, bold = true },
    ["@comment.error"]         = { fg = "#ffffff", bg = palette.crimson, bold = true },
    GitSignsCurrentLineBlame   = { fg = palette.slate, italic = true, bold = true },

    -- 10. LSP SEMANTIC TOKENS (C# / Roslyn)
    ["@lsp.type.class"]        = { link = "@type" },
    ["@lsp.type.struct"]       = { link = "@type" },
    ["@lsp.type.interface"]    = { fg = palette.purple, italic = true, bold = true },
    ["@lsp.type.enum"]         = { link = "@type" },
    ["@lsp.type.method"]       = { link = "@function" },
    ["@lsp.type.property"]     = { link = "@property" },
    ["@lsp.type.variable"]     = { link = "@variable" },
    ["@lsp.type.parameter"]    = { link = "@parameter" },
    ["@lsp.type.namespace"]    = { link = "@module" },
    ["@lsp.type.keyword"]      = { link = "@keyword" },
    ["@lsp.type.string"]       = { link = "@string" },
    ["@lsp.type.number"]       = { link = "@number" },
    ["@lsp.type.operator"]     = { link = "@operator" },
    ["@lsp.mod.readonly"]      = { italic = true },
    ["@lsp.mod.static"]        = { bold = true },

    -- 11. VENTANAS FLOTANTES BASE
    NormalFloat                = { fg = palette.neon_white, bg = palette.float_bg },
    FloatBorder                = { fg = palette.float_border, bg = palette.float_bg },
    FloatTitle                 = { fg = palette.neon_pink, bg = palette.float_bg, bold = true },
    Pmenu                      = { fg = palette.neon_white, bg = palette.float_bg },
    PmenuSel                   = { fg = palette.black, bg = palette.neon_cyan, bold = true },
    PmenuSbar                  = { bg = palette.float_bg_alt },
    PmenuThumb                 = { bg = palette.float_border },

    -- 12. TELESCOPE
    TelescopeNormal            = { fg = palette.neon_white, bg = palette.float_bg },
    TelescopeBorder            = { fg = palette.float_border, bg = palette.float_bg },
    TelescopeTitle             = { fg = palette.neon_pink, bg = palette.float_bg, bold = true },
    TelescopePromptNormal      = { fg = palette.neon_white, bg = palette.float_bg_alt },
    TelescopePromptBorder      = { fg = palette.neon_pink, bg = palette.float_bg_alt },
    TelescopePromptTitle       = { fg = palette.neon_pink, bg = palette.float_bg_alt, bold = true },
    TelescopePromptPrefix      = { fg = palette.neon_pink, bg = palette.float_bg_alt },
    TelescopeResultsNormal     = { fg = palette.neon_white, bg = palette.float_bg },
    TelescopeResultsBorder     = { fg = palette.float_border, bg = palette.float_bg },
    TelescopePreviewNormal     = { fg = palette.neon_white, bg = palette.float_bg },
    TelescopePreviewBorder     = { fg = palette.float_border, bg = palette.float_bg },
    TelescopeSelection         = { fg = palette.neon_cyan, bg = "#1a1a3e", bold = true },
    TelescopeSelectionCaret    = { fg = palette.neon_pink, bg = "#1a1a3e", bold = true },
    TelescopeMatching          = { fg = palette.neon_pink, bold = true },

    -- 13. WHICH-KEY (FIX CRÍTICO)
    WhichKey                   = { fg = palette.neon_cyan, bold = true },
    WhichKeyGroup              = { fg = palette.neon_pink, bold = true },
    WhichKeyDesc               = { fg = palette.neon_white },
    WhichKeySeparator          = { fg = "#6272a4" },
    WhichKeyFloat              = { bg = palette.float_bg },
    WhichKeyBorder             = { fg = palette.float_border, bg = palette.float_bg },
    WhichKeyNormal             = { fg = palette.neon_white, bg = palette.float_bg },
    WhichKeyTitle              = { fg = palette.neon_pink, bg = palette.float_bg, bold = true },
    WhichKeyValue              = { fg = palette.neon_orange },
    WhichKeyIconBlue           = { fg = palette.neon_blue },
    WhichKeyIconCyan           = { fg = palette.neon_cyan },
    WhichKeyIconGreen          = { fg = palette.neon_green },
    WhichKeyIconOrange         = { fg = palette.neon_orange },
    WhichKeyIconPurple         = { fg = palette.neon_purple },
    WhichKeyIconRed            = { fg = "#ff5555" },
    WhichKeyIconYellow         = { fg = "#f1fa8c" },

    -- 14. DIAGNÓSTICOS LSP
    DiagnosticError            = { fg = palette.crimson, bold = true },
    DiagnosticWarn             = { fg = palette.amber, bold = true },
    DiagnosticInfo             = { fg = palette.indigo, bold = true },
    DiagnosticHint             = { fg = palette.teal, bold = true },
    DiagnosticVirtualTextError = { fg = palette.crimson, italic = true, bold = true },
    DiagnosticVirtualTextWarn  = { fg = palette.amber, italic = true, bold = true },
    DiagnosticVirtualTextInfo  = { fg = palette.indigo, italic = true, bold = true },
    DiagnosticVirtualTextHint  = { fg = palette.teal, italic = true, bold = true },
    DiagnosticUnderlineError   = { undercurl = true, sp = palette.crimson },
    DiagnosticUnderlineWarn    = { undercurl = true, sp = palette.amber },

    -- 15. GIT SIGNS
    GitSignsAdd                = { fg = palette.forest, bg = "NONE", bold = true },
    GitSignsChange             = { fg = palette.amber, bg = "NONE", bold = true },
    GitSignsDelete             = { fg = palette.crimson, bg = "NONE", bold = true },

    -- 16. DAP-UI
    DapUIScope                 = { fg = palette.neon_cyan, bold = true },
    DapUIType                  = { fg = palette.neon_purple },
    DapUIValue                 = { fg = palette.neon_green },
    DapUIVariable              = { fg = palette.neon_cyan },
    DapUIModifiedValue         = { fg = palette.neon_orange, bold = true },
    DapUIBreakpointsPath       = { fg = palette.neon_blue },
    DapUIBreakpointsInfo       = { fg = palette.neon_green },
    DapUIStoppedThread         = { fg = palette.neon_pink, bold = true },
    DapUIFloatNormal           = { fg = palette.neon_white, bg = palette.float_bg },
    DapUIFloatBorder           = { fg = palette.float_border, bg = palette.float_bg },

    -- 17. NVIM-CMP
    CmpItemAbbr                = { fg = palette.neon_white },
    CmpItemAbbrMatch           = { fg = palette.neon_cyan, bold = true },
    CmpItemAbbrMatchFuzzy      = { fg = palette.neon_pink, bold = true },
    CmpItemKindFunction        = { fg = palette.neon_blue },
    CmpItemKindMethod          = { fg = palette.neon_blue },
    CmpItemKindVariable        = { fg = palette.neon_cyan },
    CmpItemKindKeyword         = { fg = palette.neon_pink },
    CmpItemKindText            = { fg = palette.neon_white },
    CmpItemKindClass           = { fg = palette.neon_purple },
    CmpItemKindInterface       = { fg = palette.neon_purple },
    CmpItemKindProperty        = { fg = palette.neon_orange },
    CmpItemKindSnippet         = { fg = palette.neon_green },
    CmpItemKindField           = { fg = palette.neon_orange },
    CmpItemKindModule          = { fg = palette.neon_purple, italic = true },

    -- 18. NVIM-TREE
    NvimTreeNormal             = { fg = palette.neon_white, bg = palette.float_bg },
    NvimTreeNormalNC           = { fg = palette.neon_white, bg = palette.float_bg },
    NvimTreeWinSeparator       = { fg = palette.float_border, bg = "NONE" },
    NvimTreeFolderName         = { fg = palette.neon_blue, bold = true },
    NvimTreeOpenedFolderName   = { fg = palette.neon_cyan, bold = true },
    NvimTreeRootName           = { fg = palette.neon_pink, bold = true },
    NvimTreeGitDirty           = { fg = "#f1fa8c" },
    NvimTreeGitNew             = { fg = palette.neon_green },
    NvimTreeIndentMarker       = { fg = "#414868" },

    -- 19. HARPOON
    HarpoonWindow              = { fg = palette.neon_white, bg = palette.float_bg },
    HarpoonBorder              = { fg = palette.float_border, bg = palette.float_bg },

    -- 20. COPILOT
    CopilotSuggestion          = { fg = "#8e9aaf", italic = true },
    CopilotAnnotation          = { fg = "#8e9aaf", italic = true },
}

for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
end

-- Reaplicar después de cambios de colorscheme (anti-pisado por plugins lazy)
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        for group, hl in pairs(highlights) do
            vim.api.nvim_set_hl(0, group, hl)
        end
    end,
})
