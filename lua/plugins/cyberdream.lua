require("cyberdream").setup({
    transparent = true,
    italic_comments = true,
    terminal_colors = true,
})

vim.cmd("colorscheme cyberdream")

local custom_colors = {
    -- 1. INTERFAZ, BORDES Y LINEAS
    SignColumn = { bg = "NONE" }, 
    LineNr = { fg = "#57606a", bg = "NONE" }, 
    CursorLineNr = { fg = "#ff0055", bold = true, bg = "NONE" }, 
    TelescopeNormal = { bg = "NONE" },
    TelescopeBorder = { fg = "#0f172a", bg = "NONE" },
    
    -- 2. PALABRAS CLAVE (Fucsia Neón Eléctrico)
    Keyword = { fg = "#e6005c", bold = true, italic = true },
    ["@keyword"] = { fg = "#e6005c", bold = true, italic = true },
    ["@keyword.modifier"] = { fg = "#e6005c", bold = true, italic = true },
    ["@keyword.coroutine"] = { fg = "#e6005c", bold = true, italic = true },
    ["@keyword.exception"] = { fg = "#e6005c", bold = true, italic = true },
    ["@keyword.return"] = { fg = "#e6005c", bold = true, italic = true },
    ["@keyword.import"] = { fg = "#e6005c", bold = true, italic = true }, -- FIX: Para la palabra 'namespace' y 'using'
    
    -- 3. VARIABLES Y CAMPOS PRIVADOS
    ["@variable"] = { fg = "#0f172a", bold = true },                  
    ["@variable.member"] = { fg = "#1e293b", bold = true },           
    ["@field"] = { fg = "#1e293b", bold = true },                     
    ["@property"] = { fg = "#b45309", italic = true, bold = true },   -- FIX: Propiedades en Ámbar oscuro (reemplaza al naranja pálido)
    
    -- 4. TEXTOS Y STRINGS (Verde Cyberpunk Profundo)
    String = { fg = "#047857", italic = true, bold = true }, 
    ["@string"] = { fg = "#047857", italic = true, bold = true },
    
    -- 5. FUNCIONES Y MÉTODOS (Azul Cobalto)
    ["@function"] = { fg = "#0052cc", bold = true },                  
    ["@function.call"] = { fg = "#0052cc", bold = true },
    ["@method"] = { fg = "#0052cc", bold = true },
    ["@method.call"] = { fg = "#0052cc", bold = true },
    
    -- 6. CLASES, TIPOS Y NAMESPACES (Morado Tinta)
    ["@type"] = { fg = "#6d28d9", bold = true },                      
    ["@constructor"] = { fg = "#6d28d9", bold = true },
    ["@module"] = { fg = "#6d28d9", bold = true },                    -- FIX: El nombre del namespace ("Infrastructure.Repositories")
    ["@parameter"] = { fg = "#0369a1", italic = true },               

    -- 7. BOOLEANS Y NÚMEROS (Rojo Alerta Sólido)
    ["@boolean"] = { fg = "#df0000", bold = true },                   
    ["@number"] = { fg = "#df0000", bold = true },                    
    Boolean = { fg = "#df0000", bold = true },
    Number = { fg = "#df0000", bold = true },

    -- 8. EL FIX DEFINITIVO DE SÍMBOLOS () <> = {} ; .
    -- Les ponemos Negro Casi Absoluto (#111827) y Negrita para que resalten brutalmente sobre el blanco
    ["@operator"] = { fg = "#111827", bold = true },                  -- Símbolos de igual (=), suma (+), flechas (=>)
    ["@punctuation.bracket"] = { fg = "#111827", bold = true },       -- Paréntesis (), Corchetes [], Llaves {}, y Ángulos <>
    ["@punctuation.delimiter"] = { fg = "#111827", bold = true },     -- Puntos (.), Comas (,) y Puntos y coma (;)

    -- 9. LSP SEMANTIC TOKENS (Fuerza bruta para C# Roslyn)
    ["@lsp.type.class"] = { link = "@type" },
    ["@lsp.type.interface"] = { link = "@type" },
    ["@lsp.type.method"] = { link = "@function" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.variable"] = { link = "@variable" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.namespace"] = { link = "@module" },                   -- Amarre LSP para los namespaces
}

for group, hl in pairs(custom_colors) do
    vim.api.nvim_set_hl(0, group, hl)
end
