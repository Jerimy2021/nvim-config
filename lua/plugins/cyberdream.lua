require("cyberdream").setup({
    transparent = true,
    italic_comments = true,
    terminal_colors = true,
})

vim.cmd("colorscheme cyberdream")

local custom_colors = {
    -- 1. INTERFAZ Y BORDES (Gris muy oscuro para que se lea)
    SignColumn = { bg = "NONE" }, 
    LineNr = { fg = "#8a9199", bg = "NONE" },
    CursorLineNr = { fg = "#ff0055", bold = true, bg = "NONE" }, -- Rosa sangre para la línea actual
    TelescopeNormal = { bg = "NONE" },
    TelescopeBorder = { fg = "#1a1c23", bg = "NONE" },
    
    -- 2. PALABRAS CLAVE (Fucsia/Carmín Tóxico)
    Keyword = { fg = "#e6005c", bold = true, italic = true },
    ["@keyword"] = { fg = "#e6005c", bold = true, italic = true },
    ["@keyword.modifier"] = { fg = "#e6005c", bold = true, italic = true },
    ["@keyword.coroutine"] = { fg = "#e6005c", bold = true, italic = true },
    ["@keyword.exception"] = { fg = "#e6005c", bold = true, italic = true },
    ["@keyword.return"] = { fg = "#e6005c", bold = true, italic = true },
    ["@keyword.operator"] = { fg = "#e6005c", bold = true, italic = true },
    
    -- 3. TEXTOS Y VARIABLES
    String = { fg = "#d97706", italic = true },                       -- Textos (Ámbar/Amarillo Quemado)
    ["@variable"] = { fg = "#111827", bold = true },                  -- Variables (Casi negro para máxima lectura)
    ["@property"] = { fg = "#c2410c", italic = true },                -- Atributos (Naranja Óxido)
    
    -- 4. FUNCIONES Y CLASES
    ["@function"] = { fg = "#0369a1", bold = true },                  -- Funciones (Azul Eléctrico Profundo)
    ["@function.call"] = { fg = "#0369a1", bold = true },
    ["@method"] = { fg = "#0369a1", bold = true },
    ["@method.call"] = { fg = "#0369a1", bold = true },
    
    ["@type"] = { fg = "#6b21a8", bold = true },                      -- Clases y Tipos (Morado Veneno)
    ["@constructor"] = { fg = "#6b21a8", bold = true },
    ["@parameter"] = { fg = "#0f766e", italic = true },               -- Parámetros (Verde/Cyan Oscuro)

    -- 5. LSP SEMANTIC TOKENS
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.method"] = { link = "@function" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.variable"] = { link = "@variable" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
}

for group, hl in pairs(custom_colors) do
    vim.api.nvim_set_hl(0, group, hl)
end
