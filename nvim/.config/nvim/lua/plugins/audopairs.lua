return {
	"windwp/nvim-autopairs",
	vent = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt", "vim" },
		})
	end,
}
