require("nvim-treesitter").setup({
    ensure_installed = { "java", "python", "cpp", "c", "lua", "vim", "javascript", "html" },
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true },
})
