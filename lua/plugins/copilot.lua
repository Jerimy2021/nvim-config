require("copilot").setup({
      suggestion = { enabled = true },
      panel = { enabled = true },
      filetypes = {
        python = false,
        cpp = false,
        c = false, 
        ["*"] = true, --Activa para los demàs 
      },
    })
