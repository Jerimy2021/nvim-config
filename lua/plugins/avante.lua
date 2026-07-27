-- lua/plugins/avante.lua
require('avante_lib').load()
require('avante').setup({
  provider = "copilot", 

  providers = {
    copilot = {
      model = "gpt-4o-2024-05-13", 
      extra_request_body = {
        max_tokens = 4096,
      },
    },
  },

  behaviour = {
    auto_suggestions = false, 
    auto_set_highlight_group = true,
    auto_set_keymaps = true,
    auto_apply_diff_after_generation = false,
  },
})
