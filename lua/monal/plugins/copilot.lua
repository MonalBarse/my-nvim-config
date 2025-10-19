return {
	{
		"github/copilot.vim",
		event = "InsertEnter", -- loads only when needed
		config = function()
			-- This makes Copilot behave like default:
			-- ghost text, <Tab> to accept
			vim.g.copilot_no_tab_map = false
		end,
	},
}
