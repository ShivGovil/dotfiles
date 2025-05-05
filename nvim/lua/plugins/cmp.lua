return {
	"hrsh7th/nvim-cmp",
  dependencies = {
    "altermo/ultimate-autopair.nvim",
    branch = "v0.6"
  },

	config = function()
		local cmp = require('cmp')
		cmp.setup({
			sources = {
				{name = 'nvim_lsp'},
			},
			mapping = cmp.mapping.preset.insert({
				['<s-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
				['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
				['<cr>'] = cmp.mapping.confirm({select = false}),
			}),
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
		})

		require("ultimate-autopair").setup()

	end
}
