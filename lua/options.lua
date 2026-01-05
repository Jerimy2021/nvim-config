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
vim.api.nvim_set_keymap("n", "<leader>fc", ":lua vim.lsp.buf.format()<CR>", { noremap = true, silent = true })

--elflord, murphy, ron, vim
--vim.cmd("colorscheme murphy")

vim.keymap.set('n', '<leader>V',
    function()
        -- Verifica si el archivo actual tiene una extensión de imagen
        local file_extension = vim.fn.expand('%:e')
        local image_extensions = { 'png', 'jpg', 'jpeg', 'gif', 'webp' }

        local is_image = false
        for _, ext in ipairs(image_extensions) do
            if file_extension:lower() == ext then
                is_image = true
                break
            end
        end

        if is_image then
            -- Ejecuta feh en una terminal separada, sin bloquear Neovim
            vim.cmd('silent !feh ' .. vim.fn.shellescape(vim.fn.expand('%')) .. ' &')
        else
            vim.notify('El archivo actual no parece ser una imagen compatible.', vim.log.levels.WARN)
        end
    end,
    { desc = 'Ver imagen actual con feh' }
)
