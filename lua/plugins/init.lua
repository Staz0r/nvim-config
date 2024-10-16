return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true },
    },
  },
  -- Enable startup dashboard
  {
    "goolord/alpha-nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    -- config = function()
    --   require "alpha".setup(
    --     require "alpha.themes.startify".config
    --   )
    lazy = true,
  },
  -- Session manager
  {
    "Shatur/neovim-session-manager",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require('session_manager').setup({
        autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir,
      })
    end
  },
  -- Enable jumping/hopping by using <leader>fj
  {
    "smoka7/hop.nvim",
    opts = {
      multi_windows = true,
      keys = "htnsueoaidgcrlypmbkjvx",
      uppercase_labels = true,
    },
    -- keys = {
    --   {
    --     "<leader>fj",
    --     function()
    --       require("hop").hint_words()
    --     end,
    --     mode = { "n", "x", "o" },
    --     { desc = "telecope hop"}
    --   },
    -- },
  },
  -- Inject lsp to format code <leader>fm
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.null-ls"
    end,
  },
  -- Create debugging environment on nvim
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    }
  },
  
  {
    "mfussenegger/nvim-dap",
  },
  -- UI for nvim-dap
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      require "configs.dap"
    end

  },
  -- Enable fast bracket enclosing e.g. ysiw)
  -- surr*ound_words             ysiw)           (surround_words)
  -- *make strings               ys$"            "make strings"
  -- [delete ar*ound me!]        ds]             delete around me!
  -- remove <b>HTML t*ags</b>    dst             remove HTML tags
  -- 'change quot*es'            cs'"            "change quotes"
  -- <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
  -- delete(functi*on calls)     dsf             function calls
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- Deprecated
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier",
  --       "clangd", "clang-format", "black",
  --       "python-lsp-server", "cpptools",
  --       "codelldb"
  -- 		},
  -- 	},
  -- },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css", "python",
        "cpp", "c"
  		},
  	},
  },

  {
    "mbbill/undotree",
    lazy = false,
  },
  -- Search and replace
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- ui for nvim default interface when renaming, deleting, creating file
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },
  -- -- TODO Comments
  -- {
  --   "folke/todo-comments.nvim",
  --   event = { "BufReadPre", "BufNewFile" },
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   config = require("configs.todo-comments")
  -- },
  -- This works for some reason
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local todo_comments = require("todo-comments")

      local map = vim.keymap.set

      map("n", "]t", function()
        todo_comments.jump_next()
      end, { desc = "Next todo comment" })

      map("n", "[t", function()
        todo_comments.jump_prev()
      end, { desc = "Previous todo comment" })

      todo_comments.setup()
    end,
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>wx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>wX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>wL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>wQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }
}
