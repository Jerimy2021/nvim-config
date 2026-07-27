vim.o.background = "dark"

require("tokyonight").setup({
  style = "night",       -- "night" es el estilo oscuro e intenso original. 
  transparent = false,   -- Garantiza que el fondo sea 100% sólido, sin transparencias.
  terminal_colors = true,
  styles = {
    -- Puedes mantener estas configuraciones de estilo (cursivas/negritas) 
    -- ya que son opciones nativas soportadas y no sobrescriben los colores.
    comments = { italic = true },
    keywords = { italic = true, bold = true },
    functions = { bold = true },
    variables = {},
    sidebars = "dark",   -- Usa un fondo oscuro sólido para paneles laterales (NvimTree, etc.)
    floats = "dark",     -- Usa un fondo oscuro sólido para ventanas flotantes
  },
  
})

vim.cmd("colorscheme tokyonight")
