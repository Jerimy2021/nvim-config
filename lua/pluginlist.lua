return {
	-- Tresitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	
	-- Mason
    { "williamboman/mason.nvim", lazy = false },
    { "williamboman/mason-lspconfig.nvim" },
    { "mfussenegger/nvim-jdtls" },
	
	-- Autocompletion 
	{ "hrsh7th/nvim-cmp", event = "InsertEnter" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "L3MON4D3/LuaSnip" },
	
	-- LSP
    { "neovim/nvim-lspconfig", cmd = { "LspInfo", "LspInstall", "LspStart" }, 
		event = { "BufReadPre", "BufNewFile" } 
	},

    -- Telescope
    { "nvim-telescope/telescope.nvim", 
		tag = "0.1.8", 
		dependencies = { "nvim-lua/plenary.nvim" } 
	},

	-- Comment
    { "numToStr/Comment.nvim" },

	-- Themes
    { "ellisonleao/gruvbox.nvim", priority = 1000 },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

	-- Lua line
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- Nvim tree
    { "nvim-tree/nvim-tree.lua", version = "*", lazy = false, 
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},

	-- Competitest
	{ "xeluxee/competitest.nvim", dependencies = "MunifTanjim/nui.nvim" },

	-- Mason nvim-dap
	{ "jay-babu/mason-nvim-dap.nvim"},

	-- Rcarriga nvim-dap-ui (listo)
	{ "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },

	-- Hamsta nvim-dap-virtual-text (listo)
	{ "theHamsta/nvim-dap-virtual-text" },

	-- MunifTanjim Nui 
	{ "MunifTanjim/nui.nvim" },

	-- Hydra
	{ "anuvyklack/hydra.nvim"},

	-- telescope-dap
	{ "nvim-telescope/telescope-dap.nvim"},

	-- Harpoon
	{ "ThePrimeagen/harpoon", branch = "harpoon2", requires = {"nvim-lua/plenary.nvim"}},

	-- cmp-dap
	{ "rcarriga/cmp-dap"},

	-- nvim nio
	{ "nvim-neotest/nvim-nio"},
	
	-- nvim dap
	{"mfussenegger/nvim-dap"},

	-- leetcode
	{"kawre/leetcode.nvim",
		dependencies = {"nvim-telescope/telescope.nvim",
        				"nvim-lua/plenary.nvim",
        				"MunifTanjim/nui.nvim",
		}
	},

	-- copilot 
	{"zbirenbaum/copilot.lua"},

	{"zbirenbaum/copilot-cmp", dependencies = { "zbirenbaum/copilot.lua" }},

	-- roslyn
	{ "seblyng/roslyn.nvim", lazy = true, ft = "cs" },

}


