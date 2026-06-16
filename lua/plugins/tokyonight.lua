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
    hl.SignColumn = { bg = "NONE" }
    hl.LineNr = { fg = c.dark3, bg = "NONE" }
    hl.CursorLineNr = { fg = c.red, bold = true }
    hl.TelescopeNormal = { bg = "NONE", fg = c.fg }
    hl.TelescopeBorder = { fg = c.blue, bg = "NONE" }
    hl.Directory = { fg = c.blue, bold = true } 
    hl.NvimTreeFolderIcon = { fg = c.blue7 }    
    
    -- 2. SINTAXIS BASE Y PALABRAS CLAVE (Tonos oscuros y legibles)
    hl.Keyword = { fg = c.purple, bold = true, italic = true }
    hl["@keyword.modifier"] = { fg = c.purple, bold = true, italic = true }
    hl["@keyword.coroutine"] = { fg = c.purple, bold = true, italic = true }
    hl["@keyword.exception"] = { fg = c.red, bold = true, italic = true }
    hl["@keyword.return"] = { fg = c.red, bold = true, italic = true }
    hl["@keyword.operator"] = { fg = c.purple, bold = true, italic = true }
    hl.String = { fg = c.green, italic = true } -- Verde bosque
    
    -- 3. MAGIA SEMÁNTICA (Reglas universales)
    hl["@variable"] = { fg = c.fg }                                -- Gris carbón
    hl["@property"] = { fg = c.cyan, italic = true }               -- Teal oscuro
    hl["@variable.member"] = { fg = c.cyan, italic = true } 
    
    hl["@function"] = { fg = c.blue, bold = true }                 -- Azul marino
    hl["@function.call"] = { fg = c.blue, bold = true } 
    hl["@method.call"] = { fg = c.blue, bold = true } 
    
    hl["@type"] = { fg = c.blue6, bold = true }                    -- Índigo
    hl["@constructor"] = { fg = c.blue6, bold = true } 
    hl["@parameter"] = { fg = c.orange, italic = true }            -- Naranja quemado
    
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
