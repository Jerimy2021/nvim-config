vim.g.mapleader = " "
vim.keymap.set("n","<leader>e", vim.cmd.Ex)
vim.o.clipboard = "unnamedplus"
vim.o.signcolumn = "yes"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.updatetime = 300
vim.o.termguicolors = true

-- Para guardar lo que copiaste y pegaste en el buffer
vim.keymap.set("x","<leader>p",[["_dP]])
-- Abrir terminal de la mitad para abajo
vim.keymap.set("n","<leader>tt",":below terminal<CR>")
-- Abrir terminal de la mitad para arriba
vim.keymap.set("n","<leader>ta",":above terminal<CR>")
-- Abrir terminal vertical
vim.keymap.set("n","<leader>tv",":vertical terminal<CR>")
-- Mostrar el numero de la linea que estas codeando
vim.o.number = true
-- vim.o.relativenumber = true
-- Formatting cpp
vim.api.nvim_set_keymap("n", "<leader>f", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

--elflord, murphy, ron, vim
--vim.cmd("colorscheme murphy")

