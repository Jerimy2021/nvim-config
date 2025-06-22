local lsp_defaults = require("lspconfig").util.default_config
lsp_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lsp_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }
        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", opts)
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
		vim.keymap.set("n", "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    end,
})


require("lspconfig").clangd.setup({
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
    cmd = {
        "clangd",
        "--background-index", -- Indexa en segundo plano
        "--clang-tidy",       -- Habilita clang-tidy
        "--header-insertion=iwyu", -- Evita la inserción automática de headers
        "--query-driver=/nix/store/*/bin/gcc", -- Usa el driver de gcc
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = require("lspconfig.util").root_pattern(
        "compile_commands.json", -- Busca este archivo
        "compile_flags.txt",     -- O este archivo
        ".git"                   -- O usa el directorio .git como raíz
    ),
    init_options = {
        clangdFileStatus = true,
        fallbackFlags = {
            "-std=c++17", -- Estándar de C++
            "-I/nix/store/62qjb50708fdhb4f2y7zxyqr1afir4fk-gcc-13.3.0/include/c++/13.3.0", -- Ruta de includes de gcc
            "-I/nix/store/62qjb50708fdhb4f2y7zxyqr1afir4fk-gcc-13.3.0/include/c++/13.3.0/x86_64-unknown-linux-gnu",
            "-I/nix/store/62qjb50708fdhb4f2y7zxyqr1afir4fk-gcc-13.3.0/lib/gcc/x86_64-unknown-linux-gnu/13.3.0/include",
            "-I/nix/store/62qjb50708fdhb4f2y7zxyqr1afir4fk-gcc-13.3.0/include",
            "-I/nix/store/62qjb50708fdhb4f2y7zxyqr1afir4fk-gcc-13.3.0/lib/gcc/x86_64-unknown-linux-gnu/13.3.0/include-fixed",
            "-I/nix/store/lcxvgkg659vbvdq86mhxa599wn48f35c-glibc-2.40-36-dev/include",
        },
    },
})
