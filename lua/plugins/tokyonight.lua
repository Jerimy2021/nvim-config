vim.o.background = "dark"

require("tokyonight").setup({
  style = "night",
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true, bold = true },
    functions = { bold = true },
    variables = {},
    sidebars = "dark",      -- Paneles laterales oscuros sólidos
    floats = "dark",        -- Ventanas flotantes oscuras
  },
  on_highlights = function(hl, c)
    -- ==========================================================
    -- COLORES VIBRANTES (Para resaltar sobre fondo oscuro sólido)
    -- ==========================================================
    
    -- 1. INTERFAZ Y CARPETAS
    hl.Normal = { fg = "#c0caf5" }                            -- Texto general (Blanco hielo)
    hl.SignColumn = { bg = "NONE" }
    hl.LineNr = { fg = "#3b4261" }                            -- Números de línea (Gris azulado)
    hl.CursorLineNr = { fg = "#ff9e64", bold = true }         -- Número actual (Naranja neón)
    hl.TelescopeNormal = { fg = "#c0caf5" }
    hl.TelescopeBorder = { fg = "#7aa2f7" }                   -- Bordes celestes
    hl.Directory = { fg = "#7aa2f7", bold = true }            -- Carpetas (Celeste brillante)
    hl.NvimTreeFolderIcon = { fg = "#7aa2f7" }    
    
    -- 2. SINTAXIS BASE Y PALABRAS CLAVE
    hl.Keyword = { fg = "#bb9af7", bold = true, italic = true }          -- Púrpura brillante
    hl["@keyword.modifier"] = { fg = "#bb9af7", bold = true, italic = true }
    hl["@keyword.coroutine"] = { fg = "#bb9af7", bold = true, italic = true }
    hl["@keyword.exception"] = { fg = "#f7768e", bold = true, italic = true } -- Rojo/Rosa vibrante
    hl["@keyword.return"] = { fg = "#f7768e", bold = true, italic = true }
    hl["@keyword.operator"] = { fg = "#89ddff", bold = true, italic = true }  -- Cian claro
    hl.String = { fg = "#9ece6a", italic = true }                        -- Verde manzana
    hl.Comment = { fg = "#737aa2", italic = true }                       -- Comentarios (Gris claro legible)
    
    -- 3. MAGIA SEMÁNTICA (Reglas universales)
    hl["@variable"] = { fg = "#c0caf5" }                                 -- Variables (Blanco hielo)
    hl["@property"] = { fg = "#7dcfff", italic = true }                  -- Atributos (Cian brillante)
    hl["@variable.member"] = { fg = "#7dcfff", italic = true } 
    
    hl["@function"] = { fg = "#7aa2f7", bold = true }                    -- Funciones (Azul claro)
    hl["@function.call"] = { fg = "#7aa2f7", bold = true } 
    hl["@method.call"] = { fg = "#7aa2f7", bold = true } 
    
    hl["@type"] = { fg = "#e0af68", bold = true }                        -- Clases/Tipos (Amarillo dorado)
    hl["@constructor"] = { fg = "#e0af68", bold = true } 
    hl["@parameter"] = { fg = "#ff9e64", italic = true }                 -- Parámetros (Naranja pastel)
    
    -- 4. EL JEFE FINAL: FORZAR AL LSP DE C# (y otros lenguajes)
    hl["@lsp.type.class"] = { link = "@type" }
    hl["@lsp.type.interface"] = { link = "@type" }
    hl["@lsp.type.method"] = { link = "@function" }
    hl["@lsp.type.property"] = { link = "@property" }
    hl["@lsp.type.variable"] = { link = "@variable" }
    hl["@lsp.type.parameter"] = { link = "@parameter" }
  end,
})

vim.cmd("colorscheme tokyonight")
