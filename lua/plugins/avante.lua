local chat = require("CopilotChat")

chat.setup({
  window = {
    layout = 'float', -- Puedes cambiarlo a 'vertical' si prefieres que salga a la derecha
    width = 0.8,      -- Ocupa el 80% del ancho de la pantalla
    height = 0.8,     -- Ocupa el 80% del alto
    border = 'rounded',
  },
  -- Configuración para que entienda español por defecto al hacer acciones
  prompts = {
    Explain = {
      prompt = '/COPILOT_EXPLAIN Explícame cómo funciona este código línea por línea en español.',
    },
    Optimize = -- lua/plugins/avante.lua
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
}),
    Tests = {
      prompt = '/COPILOT_TESTS Genera pruebas unitarias para este código. Responde en español.',
    },
  },
})
