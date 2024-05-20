return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("configs.conform")
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require("configs.lspconfig")
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      local mason = require("mason")

      mason.setup({})
    end,
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "eslint_d",
        -- "rubocop", # install ruby development environment first
        "gopls",
        "gofumpt",
        "goimports-reviser",
        "golines",
        "delve",
        "black",
        "isort",
        "pylint",
      },
    },
  },
  -- {
  --   "mfussenegger/nvim-lint",
  --   event = {
  --     "BufWritePre",
  --     "BufNewFile",
  --   },
  --   config = function()
  --     require("configs.nvim-lint")
  --   end,
  -- },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("configs.nvim-dap")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function()
      return require("configs/none-ls")
    end,
  },
}
