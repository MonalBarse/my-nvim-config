return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Setup LSP symbols in signcolumn
		--[[ 		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " } ]]
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- LSP keybindings
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				local keymap = vim.keymap

				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
				opts.desc = "Go to declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				opts.desc = "Show documentation"
				keymap.set("n", "K", vim.lsp.buf.hover, opts)
				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
			end,
		})

		-- Check if mason-lspconfig is available
		local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
		if mason_lspconfig_ok then
			-- Mason LSPConfig setup
			mason_lspconfig.setup({
				ensure_installed = {
					"jdtls", -- Java LSP
					"lua_ls", -- Lua LSP
					"ts_ls", -- TypeScript/JavaScript LSP
					"html", -- HTML LSP
					"cssls", -- CSS LSP
					"emmet_ls", -- Emmet LSP
					"graphql", -- GraphQL LSP
				},
				automatic_installation = true,
			})
		end

		-- Manual LSP server configurations
		local servers = {
			-- Java LSP
			jdtls = {
				capabilities = capabilities,
			},
			-- Lua LSP
			lua_ls = {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
			-- TypeScript/JavaScript LSP
			ts_ls = {
				capabilities = capabilities,
			},
			-- HTML LSP
			html = {
				capabilities = capabilities,
			},
			-- CSS LSP
			cssls = {
				capabilities = capabilities,
			},
			-- GraphQL LSP
			graphql = {
				capabilities = capabilities,
				filetypes = { "graphql", "gql", "typescriptreact", "javascriptreact" },
			},
			-- Emmet LSP
			emmet_ls = {
				capabilities = capabilities,
				filetypes = {
					"html",
					"typescriptreact",
					"javascriptreact",
					"css",
					"sass",
					"scss",
					"less",
				},
			},
		}

		-- Setup LSP servers
		for server_name, config in pairs(servers) do
			-- Check if the server is available before setting it up
			if lspconfig[server_name] then
				lspconfig[server_name].setup(config)
			end
		end
	end,
}
