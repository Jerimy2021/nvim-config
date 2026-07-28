-- Directorio de instalación (valor por defecto oficial)
require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

-- Parsers a instalar (equivalente a tu viejo ensure_installed)
local ensure_installed = {
  "java", "python", "cpp", "c", "lua", "vim",
  "vimdoc", "javascript", "html", "c_sharp",
  "bash", "json", "query", "markdown", "markdown_inline",
}

require("nvim-treesitter").install(ensure_installed)

-- Activar highlighting + indentación por FileType (ya no se configura dentro de setup)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    pcall(vim.treesitter.start)
    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
