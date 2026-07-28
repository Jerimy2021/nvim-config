local ok, parsers = pcall(require, "nvim-treesitter.parsers")
if ok and not parsers.ft_to_lang then
  parsers.ft_to_lang = function(ft)
    return vim.treesitter.language.get_lang(ft) or ft
  end
end

local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  }
})

-- Mapas de teclas
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Buscar archivos" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,   { desc = "Telescope: Buscar texto (grep)" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,     { desc = "Telescope: Buffers abiertos" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,   { desc = "Telescope: Ayuda" })
vim.keymap.set("n", "<leader>j", "<cmd>Telescope jumplist<CR>", { desc = "Jump list" })
