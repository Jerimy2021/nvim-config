require("gruvbox").setup({
  contrast = "hard",        -- Colores intensos y fondo oscuro sólido original
  transparent_mode = false, -- Fondo 100% opaco
  terminal_colors = true,
  italic = {
    strings = true,
    comments = true,
    operators = false,
    folds = true,
  },
})

vim.cmd("colorscheme gruvbox")
