require("cyberdream").setup({
    transparent = true,
    italic_comments = true,
    terminal_colors = true,
    -- Desactivamos los overrides internos del tema para que no pisen los nuestros
    theme = {
        variant = "default",
        highlights = {
            -- Forzar fondo transparente en el editor principal
            Normal = { bg = "NONE" },
            NormalNC = { bg = "NONE" },
        },
    },
})

vim.cmd("colorscheme cyberdream")

-- =============================================================================
-- PALETA NEÓN CYBERPUNK PARA FONDO TRANSPARENTE
-- =============================================================================
-- REGLA DE ORO: Con transparencia activa y wallpaper claro, TODOS los colores
-- de texto deben ser brillantes y saturados. Cero colores oscuros (#0f172a, etc).
--
-- La legibilidad se logra de dos formas:
--   1. Texto del editor     → Colores neón brillantes (contrastan contra todo)
--   2. Ventanas flotantes   → Fondo semi-opaco oscuro (#0a0a1a) para aislar del wallpaper
-- =============================================================================

local palette = {
    -- Neones primarios
    pink      = "#ff2a6d",   -- Keywords, palabras reservadas
    cyan      = "#05d9e8",   -- Variables
    green     = "#00ff9f",   -- Strings
    blue      = "#7aa2f7",   -- Funciones y métodos
    purple    = "#bd93f9",   -- Tipos, clases, constructores
    orange    = "#ffb86c",   -- Propiedades y campos
    red       = "#ff6e6e",   -- Booleanos y números
    sky       = "#8be9fd",   -- Parámetros
    lavender  = "#c792ea",   -- Módulos y namespaces
    yellow    = "#f1fa8c",   -- Advertencias y acentos

    -- Neutros para estructura
    white     = "#e2e8f0",   -- Operadores, puntuación, texto general
    gray      = "#6272a4",   -- Comentarios
    line_nr   = "#565f89",   -- Números de línea
    cursor_nr = "#ff2a6d",   -- Línea actual

    -- Fondos flotantes (semi-opacos para aislar del wallpaper)
    float_bg  = "#0a0a1a",   -- Fondo de ventanas flotantes
    float_border = "#414868", -- Bordes de ventanas flotantes
}

local highlights = {

    -- =========================================================================
    -- 1. INTERFAZ BASE
    -- =========================================================================
    Normal         = { fg = palette.white, bg = "NONE" },
    NormalNC       = { bg = "NONE" },
    SignColumn     = { bg = "NONE" },
    LineNr         = { fg = palette.line_nr, bg = "NONE" },
    CursorLineNr   = { fg = palette.cursor_nr, bold = true, bg = "NONE" },
    CursorLine     = { bg = "#1a1a2e" },
    Visual         = { bg = "#2d2b55" },
    Search         = { fg = "#000000", bg = palette.yellow, bold = true },
    IncSearch      = { fg = "#000000", bg = palette.orange, bold = true },
    VertSplit      = { fg = palette.float_border, bg = "NONE" },
    WinSeparator   = { fg = palette.float_border, bg = "NONE" },
    EndOfBuffer    = { fg = "#1a1a2e", bg = "NONE" },
    NonText        = { fg = "#2d2b55" },

    -- Ventanas flotantes (CRÍTICO: fondo oscuro para legibilidad)
    NormalFloat    = { fg = palette.white, bg = palette.float_bg },
    FloatBorder    = { fg = palette.sky, bg = palette.float_bg },
    FloatTitle     = { fg = palette.pink, bg = palette.float_bg, bold = true },

    -- Menú de autocompletado (Pmenu)
    Pmenu          = { fg = palette.white, bg = palette.float_bg },
    PmenuSel       = { fg = "#000000", bg = palette.blue, bold = true },
    PmenuSbar      = { bg = "#1a1a2e" },
    PmenuThumb     = { bg = palette.blue },

    -- =========================================================================
    -- 2. PALABRAS CLAVE (Rosa Neón Eléctrico)
    -- =========================================================================
    Keyword                    = { fg = palette.pink, bold = true, italic = true },
    Statement                  = { fg = palette.pink, bold = true, italic = true },
    Conditional                = { fg = palette.pink, bold = true, italic = true },
    Repeat                     = { fg = palette.pink, bold = true, italic = true },
    Exception                  = { fg = palette.pink, bold = true, italic = true },
    Include                    = { fg = palette.pink, bold = true, italic = true },
    ["@keyword"]               = { fg = palette.pink, bold = true, italic = true },
    ["@keyword.modifier"]      = { fg = palette.pink, bold = true, italic = true },
    ["@keyword.coroutine"]     = { fg = palette.pink, bold = true, italic = true },
    ["@keyword.exception"]     = { fg = palette.pink, bold = true, italic = true },
    ["@keyword.return"]        = { fg = palette.pink, bold = true, italic = true },
    ["@keyword.import"]        = { fg = palette.pink, bold = true, italic = true },
    ["@keyword.conditional"]   = { fg = palette.pink, bold = true, italic = true },
    ["@keyword.repeat"]        = { fg = palette.pink, bold = true, italic = true },
    ["@keyword.operator"]      = { fg = palette.pink, bold = true },

    -- =========================================================================
    -- 3. VARIABLES Y CAMPOS (Cyan Neón)
    -- =========================================================================
    ["@variable"]              = { fg = palette.cyan, bold = true },
    ["@variable.member"]       = { fg = palette.orange, bold = true },
    ["@variable.parameter"]    = { fg = palette.sky, italic = true },
    ["@variable.builtin"]      = { fg = palette.sky, italic = true, bold = true },
    ["@field"]                 = { fg = palette.orange, bold = true },
    ["@property"]              = { fg = palette.orange, italic = true, bold = true },
    Identifier                 = { fg = palette.cyan },

    -- =========================================================================
    -- 4. STRINGS (Verde Neón Cyberpunk)
    -- =========================================================================
    String                     = { fg = palette.green, italic = true },
    ["@string"]                = { fg = palette.green, italic = true },
    ["@string.escape"]         = { fg = palette.yellow, bold = true },
    ["@string.special"]        = { fg = palette.yellow },
    Character                  = { fg = palette.green },

    -- =========================================================================
    -- 5. FUNCIONES Y MÉTODOS (Azul Periwinkle)
    -- =========================================================================
    Function                   = { fg = palette.blue, bold = true },
    ["@function"]              = { fg = palette.blue, bold = true },
    ["@function.call"]         = { fg = palette.blue, bold = true },
    ["@function.builtin"]      = { fg = palette.blue, bold = true, italic = true },
    ["@method"]                = { fg = palette.blue, bold = true },
    ["@method.call"]           = { fg = palette.blue, bold = true },

    -- =========================================================================
    -- 6. TIPOS, CLASES Y NAMESPACES (Púrpura Neón)
    -- =========================================================================
    Type                       = { fg = palette.purple, bold = true },
    ["@type"]                  = { fg = palette.purple, bold = true },
    ["@type.builtin"]          = { fg = palette.purple, bold = true, italic = true },
    ["@type.qualifier"]        = { fg = palette.pink, italic = true },
    ["@constructor"]           = { fg = palette.purple, bold = true },
    ["@module"]                = { fg = palette.lavender, bold = true },
    ["@parameter"]             = { fg = palette.sky, italic = true },

    -- =========================================================================
    -- 7. BOOLEANOS Y NÚMEROS (Rojo Coral Brillante)
    -- =========================================================================
    ["@boolean"]               = { fg = palette.red, bold = true },
    ["@number"]                = { fg = palette.red, bold = true },
    ["@number.float"]          = { fg = palette.red, bold = true },
    Boolean                    = { fg = palette.red, bold = true },
    Number                     = { fg = palette.red, bold = true },
    Float                      = { fg = palette.red, bold = true },

    -- =========================================================================
    -- 8. OPERADORES Y PUNTUACIÓN (Blanco Brillante)
    -- =========================================================================
    Operator                   = { fg = palette.white, bold = true },
    ["@operator"]              = { fg = palette.white, bold = true },
    ["@punctuation.bracket"]   = { fg = palette.white, bold = true },
    ["@punctuation.delimiter"] = { fg = palette.white, bold = true },
    ["@punctuation.special"]   = { fg = palette.white, bold = true },
    Delimiter                  = { fg = palette.white },
    Special                    = { fg = palette.orange },

    -- =========================================================================
    -- 9. COMENTARIOS (Gris Azulado Suave)
    -- =========================================================================
    Comment                    = { fg = palette.gray, italic = true },
    ["@comment"]               = { fg = palette.gray, italic = true },
    ["@comment.todo"]          = { fg = "#000000", bg = palette.yellow, bold = true },
    ["@comment.note"]          = { fg = "#000000", bg = palette.sky, bold = true },
    ["@comment.warning"]       = { fg = "#000000", bg = palette.orange, bold = true },
    ["@comment.error"]         = { fg = "#000000", bg = palette.red, bold = true },

    -- =========================================================================
    -- 10. LSP SEMANTIC TOKENS (C# / Roslyn)
    -- =========================================================================
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

    -- =========================================================================
    -- 11. TELESCOPE (Fondo aislado del wallpaper)
    -- =========================================================================
    TelescopeNormal            = { fg = palette.white, bg = palette.float_bg },
    TelescopeBorder            = { fg = palette.float_border, bg = palette.float_bg },
    TelescopeTitle             = { fg = palette.pink, bg = palette.float_bg, bold = true },
    TelescopePromptNormal      = { fg = palette.white, bg = "#111122" },
    TelescopePromptBorder      = { fg = palette.pink, bg = "#111122" },
    TelescopePromptTitle       = { fg = palette.pink, bg = "#111122", bold = true },
    TelescopePromptPrefix      = { fg = palette.pink, bg = "#111122" },
    TelescopeResultsNormal     = { fg = palette.white, bg = palette.float_bg },
    TelescopeResultsBorder     = { fg = palette.float_border, bg = palette.float_bg },
    TelescopePreviewNormal     = { fg = palette.white, bg = palette.float_bg },
    TelescopePreviewBorder     = { fg = palette.float_border, bg = palette.float_bg },
    TelescopeSelection         = { fg = palette.cyan, bg = "#1a1a3e", bold = true },
    TelescopeMatching          = { fg = palette.pink, bold = true },

    -- =========================================================================
    -- 12. WHICH-KEY (FIX PRINCIPAL - Fondo aislado + colores neón)
    -- =========================================================================
    WhichKey                   = { fg = palette.cyan, bold = true },        -- Las teclas (1, 2, e, f, etc.)
    WhichKeyGroup              = { fg = palette.pink, bold = true },        -- Nombres de grupos (+)
    WhichKeyDesc               = { fg = palette.white },                    -- Descripción de acciones
    WhichKeySeparator          = { fg = palette.gray },                     -- El separador (→)
    WhichKeyFloat              = { bg = palette.float_bg },                 -- Fondo de la ventana
    WhichKeyBorder             = { fg = palette.float_border, bg = palette.float_bg },
    WhichKeyNormal             = { fg = palette.white, bg = palette.float_bg },
    WhichKeyTitle              = { fg = palette.pink, bg = palette.float_bg, bold = true },
    WhichKeyValue              = { fg = palette.orange },
    WhichKeyIconBlue           = { fg = palette.blue },
    WhichKeyIconCyan           = { fg = palette.cyan },
    WhichKeyIconGreen          = { fg = palette.green },
    WhichKeyIconOrange         = { fg = palette.orange },
    WhichKeyIconPurple         = { fg = palette.purple },
    WhichKeyIconRed            = { fg = palette.red },
    WhichKeyIconYellow         = { fg = palette.yellow },

    -- =========================================================================
    -- 13. DIAGNÓSTICOS LSP
    -- =========================================================================
    DiagnosticError            = { fg = "#ff5555" },
    DiagnosticWarn             = { fg = palette.yellow },
    DiagnosticInfo             = { fg = palette.sky },
    DiagnosticHint             = { fg = palette.green },
    DiagnosticVirtualTextError = { fg = "#ff5555", italic = true },
    DiagnosticVirtualTextWarn  = { fg = palette.yellow, italic = true },
    DiagnosticVirtualTextInfo  = { fg = palette.sky, italic = true },
    DiagnosticVirtualTextHint  = { fg = palette.green, italic = true },
    DiagnosticUnderlineError   = { undercurl = true, sp = "#ff5555" },
    DiagnosticUnderlineWarn    = { undercurl = true, sp = palette.yellow },

    -- =========================================================================
    -- 14. GIT SIGNS
    -- =========================================================================
    GitSignsAdd                = { fg = palette.green, bg = "NONE" },
    GitSignsChange             = { fg = palette.yellow, bg = "NONE" },
    GitSignsDelete             = { fg = palette.red, bg = "NONE" },

    -- =========================================================================
    -- 15. NVIM-DAP-UI (Debug con fondo aislado)
    -- =========================================================================
    DapUIScope                 = { fg = palette.cyan, bold = true },
    DapUIType                  = { fg = palette.purple },
    DapUIValue                 = { fg = palette.green },
    DapUIVariable              = { fg = palette.cyan },
    DapUIModifiedValue         = { fg = palette.orange, bold = true },
    DapUIBreakpointsPath       = { fg = palette.sky },
    DapUIBreakpointsInfo       = { fg = palette.green },
    DapUIStoppedThread         = { fg = palette.pink, bold = true },
    DapUIFloatNormal           = { fg = palette.white, bg = palette.float_bg },
    DapUIFloatBorder           = { fg = palette.float_border, bg = palette.float_bg },

    -- =========================================================================
    -- 16. NVIM-CMP (Autocompletado)
    -- =========================================================================
    CmpItemAbbr                = { fg = palette.white },
    CmpItemAbbrMatch           = { fg = palette.cyan, bold = true },
    CmpItemAbbrMatchFuzzy      = { fg = palette.sky },
    CmpItemKindFunction        = { fg = palette.blue },
    CmpItemKindMethod          = { fg = palette.blue },
    CmpItemKindVariable        = { fg = palette.cyan },
    CmpItemKindKeyword         = { fg = palette.pink },
    CmpItemKindText            = { fg = palette.white },
    CmpItemKindClass           = { fg = palette.purple },
    CmpItemKindInterface       = { fg = palette.purple },
    CmpItemKindProperty        = { fg = palette.orange },
    CmpItemKindSnippet         = { fg = palette.green },
    CmpItemKindField           = { fg = palette.orange },
    CmpItemKindModule          = { fg = palette.lavender },

    -- =========================================================================
    -- 17. NVIM-TREE (Explorador de archivos)
    -- =========================================================================
    NvimTreeNormal             = { fg = palette.white, bg = palette.float_bg },
    NvimTreeNormalNC           = { fg = palette.white, bg = palette.float_bg },
    NvimTreeWinSeparator       = { fg = palette.float_border, bg = "NONE" },
    NvimTreeFolderName         = { fg = palette.blue, bold = true },
    NvimTreeOpenedFolderName   = { fg = palette.cyan, bold = true },
    NvimTreeRootName           = { fg = palette.pink, bold = true },
    NvimTreeGitDirty           = { fg = palette.yellow },
    NvimTreeGitNew             = { fg = palette.green },

    -- =========================================================================
    -- 18. HARPOON
    -- =========================================================================
    HarpoonWindow              = { fg = palette.white, bg = palette.float_bg },
    HarpoonBorder              = { fg = palette.sky, bg = palette.float_bg },

    -- =========================================================================
    -- 19. COPILOT
    -- =========================================================================
    CopilotSuggestion          = { fg = "#4a5568", italic = true },
    CopilotAnnotation          = { fg = "#4a5568", italic = true },
}

-- Aplicar todos los highlights
for group, hl in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, hl)
end

-- =========================================================================
-- FIX: Reaplicar highlights después de que el colorscheme cargue
-- Esto previene que lazy-loading de plugins pise nuestros colores
-- =========================================================================
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        for group, hl in pairs(highlights) do
            vim.api.nvim_set_hl(0, group, hl)
        end
    end,
})
