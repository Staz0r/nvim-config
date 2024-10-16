local cmp = require("cmp")

local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  completion = { completeopt = "menu,menuone,preview,noselect",
  },
  snippet = { -- configure how nvim-cmp interacts with snippet engine
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-q>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  },
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" }, -- file system paths
    { name = "copilot" },
  }),
})
