return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {"nvim-lua/plenary.nvim"},
		config = function()
			require('telescope').setup({})
			local builtin = require('telescope.builtin')

			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>ft', builtin.treesitter, { desc = 'Telescope treesitter' })
      vim.keymap.set('n', '<leader>fs', builtin.git_status, { desc = 'Telescope git status/diff' })

			require("telescope").load_extension "file_browser"

			vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR><Esc>')
		end
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {"nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim"},
	}
}
