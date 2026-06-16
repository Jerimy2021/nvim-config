-- Forzamos el modo claro
vim.o.background = "light"

require("gruvbox").setup({
  contrast = "hard",        -- Alto contraste para máxima legibilidad
  transparent_mode = false, -- APAGADO. Esta es la clave del éxito.
  terminal_colors = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
  -- Sin overrides: dejamos que Gruvbox use su paleta perfecta por defecto
})

vim.cmd("colorscheme gruvbox")
