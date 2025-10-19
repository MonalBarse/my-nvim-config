return {
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				on_highlights = function(hl, c)
					local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = prompt,
					}
					hl.TelescopePromptBorder = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePromptTitle = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
				end,
				style = "Storm",
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			})

			vim.cmd([[colorscheme tokyonight]])
			local hl = vim.api.nvim_set_hl

			-- Telescope
			hl(0, "TelescopeNormal", { bg = "none" })
			hl(0, "TelescopeBorder", { bg = "none" })
			hl(0, "TelescopePromptNormal", { bg = "none" })
			hl(0, "TelescopePromptBorder", { bg = "none" })
			hl(0, "TelescopeResultsNormal", { bg = "none" })
			hl(0, "TelescopeResultsBorder", { bg = "none" })
			hl(0, "TelescopePreviewNormal", { bg = "none" })
			hl(0, "TelescopePreviewBorder", { bg = "none" })

			-- NvimTree
			hl(0, "NvimTreeNormal", { bg = "none" })
			hl(0, "NvimTreeNormalNC", { bg = "none" })
			hl(0, "NvimTreeVertSplit", { bg = "none" })
			hl(0, "NvimTreeEndOfBuffer", { bg = "none" })

			-- Popup Menus & UI
			hl(0, "Pmenu", { bg = "none" })
			hl(0, "PmenuSel", { bg = "none" })
			hl(0, "WhichKeyFloat", { bg = "none" })
			hl(0, "LspInfoBorder", { bg = "none" })

			-- Lazy, Mason, Noice, etc.
			hl(0, "NormalFloat", { bg = "none" })
			hl(0, "FloatBorder", { bg = "none" })
			hl(0, "LazyNormal", { bg = "none" })
			hl(0, "MasonNormal", { bg = "none" })
			hl(0, "NormalNC", { bg = "none" })

			-- Make comment and line number more visible
			hl(0, "Comment", { fg = "#5c6370", italic = true }) -- readable comment
			hl(0, "LineNr", { fg = "#666666" }) -- darker line numbers

			-- Make current line subtle
			hl(0, "CursorLine", { bg = "#1e1e2e" }) -- subtle dark background

			-- Make relative line numbers (LineNr) more visible
			hl(0, "LineNr", { fg = "#666666", bg = "none" }) -- dark gray

			-- Make current line number (CursorLineNr) stand out
			hl(0, "CursorLineNr", { fg = "#ffffff", bold = true, bg = "none" }) -- white & bold
			-- Make visual selection more subtle
			hl(0, "Visual", { bg = "#3b4261" }) -- a faint blueish highlight
		end,
	},
}
