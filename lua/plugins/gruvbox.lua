vim.o.background = "light"

require("gruvbox").setup({
  contrast = "hard",
  transparent_mode = true,
  terminal_colors = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  overrides = {
    -- 1. INTERFAZ Y BORDES
    Normal = { fg = "#3c3836", bg = "NONE" },       -- Texto base (Marrón muy oscuro)
    SignColumn = { bg = "NONE" },
    LineNr = { fg = "#7c6f64", bg = "NONE" },       -- Números de línea
    CursorLineNr = { fg = "#9d0006", bold = true }, -- Número actual (Rojo oscuro intenso)
    TelescopeNormal = { bg = "NONE", fg = "#3c3836" },
    TelescopeBorder = { fg = "#076678", bg = "NONE" },
    
    -- 2. SINTAXIS BASE Y PALABRAS CLAVE DETALLADAS
    Keyword = { fg = "#9d0006", bold = true, italic = true }, -- Rojo oscuro fuerte
    ["@keyword.modifier"] = { fg = "#9d0006", bold = true, italic = true },
    ["@keyword.coroutine"] = { fg = "#9d0006", bold = true, italic = true },
    ["@keyword.exception"] = { fg = "#9d0006", bold = true, italic = true },
    ["@keyword.return"] = { fg = "#9d0006", bold = true, italic = true },
    ["@keyword.operator"] = { fg = "#9d0006", bold = true, italic = true },
    String = { fg = "#79740e", italic = true },               -- Verde oliva oscuro
    Comment = { fg = "#928374", italic = true, bold = true }, -- Comentarios legibles
    
    -- 3. MAGIA SEMÁNTICA (Reglas universales)
    ["@variable"] = { fg = "#3c3836" },                       -- Variables (Marrón oscuro)
    ["@property"] = { fg = "#af3a03", italic = true },        -- Atributos (Naranja quemado)
    ["@variable.member"] = { fg = "#af3a03", italic = true }, 
    
    ["@function"] = { fg = "#076678", bold = true },          -- Funciones (Azul océano oscuro)
    ["@function.call"] = { fg = "#076678", bold = true },     
    ["@method.call"] = { fg = "#076678", bold = true },       
    
    ["@type"] = { fg = "#8f3f71", bold = true },              -- Clases y Tipos (Púrpura oscuro)
    ["@constructor"] = { fg = "#8f3f71", bold = true },       
    ["@parameter"] = { fg = "#427b58", italic = true },       -- Parámetros (Aqua oscuro)
    
    -- 4. EL JEFE FINAL: FORZAR AL LSP DE C#
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.method"] = { link = "@function" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.variable"] = { link = "@variable" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
  },
})

vim.cmd("colorscheme gruvbox")
