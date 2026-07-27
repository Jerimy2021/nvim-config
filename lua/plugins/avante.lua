require('avante_lib').load()
require('avante').setup({
  -- ============================================================
  -- AQUÍ ES DONDE CAMBIAS DE IA EN EL FUTURO
  -- Actualmente usará tu Copilot gratuito de estudiante.
  -- Si mañana compras Claude, solo cambias "copilot" por "claude"
  -- ============================================================
  provider = "copilot", 

  copilot = {
    model = "gpt-4o-2024-05-13", -- Usa el modelo más inteligente disponible en Copilot
    max_tokens = 4096,
  },
  
  -- claude = {
  --   endpoint = "https://api.anthropic.com",
  --   model = "claude-3-5-sonnet-20240620",
  --   temperature = 0,
  --   max_tokens = 4096,
  -- },

  behaviour = {
    auto_suggestions = false, -- Lo apagamos porque copilot.lua ya hace las sugerencias fantasma
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
  },
})
