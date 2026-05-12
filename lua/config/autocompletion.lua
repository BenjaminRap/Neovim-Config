vim.opt.completeopt = { "menu", "menuone", "noselect", "preview" }

local	lspkind = require("lspkind")
lspkind.init({})

local	cmp = require("cmp")

cmp.setup({
    sources = cmp.config.sources({
		{ name = 'nvim_lsp' },  -- LSP
		{ name = 'buffer' },    -- Buffer courant
		{ name = 'luasnip' },   -- snippets
		{ name = 'path' },      -- Chemin
    }),
    mapping = cmp.mapping.preset.insert({
		[ "<C-j>" ] = cmp.mapping.select_next_item { cmp.SelectBehavior.Insert },
		[ "<C-k>" ] = cmp.mapping.select_prev_item { cmp.SelectBehavior.Insert },
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-l>'] = cmp.mapping.confirm({ select = true }),
		['<C-h>'] = cmp.mapping.abort(),
    }),
    snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
    },
    formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol',
			maxwidth = {
			menu = 50,
			abbr = 50,
		},
		ellipsis_char = '...',
		show_labelDetails = true, -- show labelDetails in menu. Disabled by default

		before = function (entry, vim_item)
			return vim_item
		end
		})
    }
})

vim.keymap.set("n", "<leader>ldf", vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ldc", vim.lsp.buf.declaration, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lrf", vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, {})
vim.keymap.set("n", '<leader>lrn', vim.lsp.buf.rename, {})
vim.keymap.set("n", '<leader>le', vim.diagnostic.open_float, {})

require("luasnip.loaders.from_vscode").lazy_load()
