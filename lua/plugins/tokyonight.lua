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
    sidebars = "dark",
    floats = "dark",
  },
  on_highlights = function(hl, c)
    -- ==========================================================
    -- COLORES VIBRANTES Y FONDO ABSOLUTAMENTE SÓLIDO
    -- ==========================================================
    
    -- 1. INTERFAZ: Forzamos el fondo oscuro del tema (c.bg)
    hl.Normal = { fg = "#c0caf5", bg = c.bg }                 -- FONDO SÓLIDO FORZADO
    hl.SignColumn = { bg = c.bg }                             -- Columna lateral sólida
    hl.LineNr = { fg = "#3b4261", bg = c.bg }                 -- Números de línea con fondo
    hl.CursorLineNr = { fg = "#ff9e64", bold = true, bg = c.bg } 
    hl.TelescopeNormal = { fg = "#c0caf5", bg = c.bg }
    hl.TelescopeBorder = { fg = "#7aa2f7", bg = c.bg }
    hl.Directory = { fg = "#7aa2f7", bold = true }
    hl.NvimTreeFolderIcon = { fg = "#7aa2f7" }    
    
    -- 2. SINTAXIS BASE Y PALABRAS CLAVE
    hl.Keyword = { fg = "#bb9af7", bold = true, italic = true }
    hl["@keyword.modifier"] = { fg = "#bb9af7", bold = true, italic = true }
    hl["@keyword.coroutine"] = { fg = "#bb9af7", bold = true, italic = true }
    hl["@keyword.exception"] = { fg = "#f7768e", bold = true, italic = true } 
    hl["@keyword.return"] = { fg = "#f7768e", bold = true, italic = true }
    hl["@keyword.operator"] = { fg = "#89ddff", bold = true, italic = true }  
    hl.String = { fg = "#9ece6a", italic = true }                        
    hl.Comment = { fg = "#737aa2", italic = true }                       
    
    -- 3. MAGIA SEMÁNTICA (Reglas universales)
    hl["@variable"] = { fg = "#c0caf5" }                                 
    hl["@property"] = { fg = "#7dcfff", italic = true }                  
    hl["@variable.member"] = { fg = "#7dcfff", italic = true } 
    
    hl["@function"] = { fg = "#7aa2f7", bold = true }                    
    hl["@function.call"] = { fg = "#7aa2f7", bold = true } 
    hl["@method.call"] = { fg = "#7aa2f7", bold = true } 
    
    hl["@type"] = { fg = "#e0af68", bold = true }                        
    hl["@constructor"] = { fg = "#e0af68", bold = true } 
    hl["@parameter"] = { fg = "#ff9e64", italic = true }                 
    
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
