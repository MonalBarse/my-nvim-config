return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({
			-- enable syntax highlighting with additional safety
			highlight = {
				enable = true,
				-- Disable treesitter highlighting for large files to prevent performance issues
				disable = function(lang, buf)
					local max_filesize = 100 * 1024 -- 100 KB
					local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
					if ok and stats and stats.size > max_filesize then
						return true
					end
				end,
				-- Additional safety setting
				additional_vim_regex_highlighting = false,
			},
			-- enable indentation
			indent = {
				enable = true,
				-- Disable for problematic languages if needed
				disable = {},
			},
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
				filetypes = {
					"html",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"tsx",
					"jsx",
					"xml",
				},
			},
			-- ensure these language parsers are installed
			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"java",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"graphql",
				"bash",
				"lua",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
			},
			-- Prevent automatic installation issues
			auto_install = false,

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},

			-- Add these settings to prevent window-related issues
			sync_install = false,
			ignore_install = {},

			-- Additional modules that might help with stability
			modules = {},
		})

		-- Additional safety: Handle treesitter errors gracefully
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "*",
			callback = function()
				local buf = vim.api.nvim_get_current_buf()
				local ft = vim.bo[buf].filetype

				-- Skip treesitter for certain filetypes that might cause issues
				local skip_ft = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				}

				for _, skip in ipairs(skip_ft) do
					if ft == skip then
						vim.bo[buf].syntax = "off"
						return
					end
				end
			end,
		})
	end,
}
