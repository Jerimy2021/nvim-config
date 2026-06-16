vim.o.background = "light"

require("tokyonight").setup({
  style = "day",
  transparent = true,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true, bold = true },
    functions = { bold = true },
    variables = {},
    sidebars = "transparent",
    floats = "transparent",
  },
  on_highlights = function(hl, c)
    -- ==========================================================
    -- COLORES ULTRA-OSCUROS (Para vencer al fondo de pantalla)
    -- ==========================================================
    
    -- 1. INTERFAZ Y CARPETAS
    hl.Normal = { fg = "#111111", bg = "NONE" }               -- Texto general casi negro
    hl.SignColumn = { bg = "NONE" }
    hl.LineNr = { fg = "#666666", bg = "NONE" }               -- Números de línea gris oscuro
    hl.CursorLineNr = { fg = "#d70000", bold = true }         -- Número actual rojo sangre
    hl.TelescopeNormal = { bg = "NONE", fg = "#111111" }
    hl.TelescopeBorder = { fg = "#0000d7", bg = "NONE" }
    hl.Directory = { fg = "#0000d7", bold = true }            -- Carpetas azul profundo
    hl.NvimTreeFolderIcon = { fg = "#0000d7" }    
    
    -- 2. SINTAXIS BASE Y PALABRAS CLAVE
    hl.Keyword = { fg = "#800080", bold = true, italic = true }          -- Púrpura oscuro
    hl["@keyword.modifier"] = { fg = "#800080", bold = true, italic = true }
    hl["@keyword.coroutine"] = { fg = "#800080", bold = true, italic = true }
    hl["@keyword.exception"] = { fg = "#d70000", bold = true, italic = true } -- Rojo sangre
    hl["@keyword.return"] = { fg = "#d70000", bold = true, italic = true }
    hl["@keyword.operator"] = { fg = "#800080", bold = true, italic = true }
    hl.String = { fg = "#005f00", italic = true }                        -- Verde bosque muy oscuro
    hl.Comment = { fg = "#4e4e4e", italic = true, bold = true }          -- Comentarios gris muy fuerte
    
    -- 3. MAGIA SEMÁNTICA (Reglas universales)
    hl["@variable"] = { fg = "#111111" }                                 -- Variables casi negras
    hl["@property"] = { fg = "#005f87", italic = true, bold = true }     -- Atributos teal oscuro
    hl["@variable.member"] = { fg = "#005f87", italic = true, bold = true } 
    
    hl["@function"] = { fg = "#0000d7", bold = true }                    -- Funciones azul marino
    hl["@function.call"] = { fg = "#0000d7", bold = true } 
    hl["@method.call"] = { fg = "#0000d7", bold = true } 
    
    hl["@type"] = { fg = "#5f00d7", bold = true }                        -- Clases índigo oscuro
    hl["@constructor"] = { fg = "#5f00d7", bold = true } 
    hl["@parameter"] = { fg = "#af5f00", italic = true, bold = true }    -- Parámetros marrón/naranja quemado
    
    -- 4. EL JEFE FINAL: FORZAR AL LSP DE C#
    hl["@lsp.type.class"] = { link = "@type" }
    hl["@lsp.type.interface"] = { link = "@type" }
    hl["@lsp.type.method"] = { link = "@function" }
    hl["@lsp.type.property"] = { link = "@property" }
    hl["@lsp.type.variable"] = { link = "@variable" }
    hl["@lsp.type.parameter"] = { link = "@parameter" }
  end,
})

vim.cmd("colorscheme tokyonight")
