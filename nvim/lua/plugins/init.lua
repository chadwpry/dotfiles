return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
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
  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier",
        "gopls", "gofumpt", "goimports-reviser", "golines", "delve",
  		},
  	},
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      require("dapui").setup()
      require("dap-go").setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      vim.keymap.set("n", "<Leader>ds", function()
        dap.continue()
        dapui.toggle({})
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
      end)
      vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
      vim.keymap.set("n", "<Leader>ds", function()
        dap.continue()
        dapui.toggle({})
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-w>=", false, true, true), "n", false)
      end)
      vim.keymap.set("n", "<Leader>de", function()
        dap.terminate()
        dapui.toggle({})
      end)
      vim.keymap.set("n", "<Leader>dsd", dap.step_into, {})
      vim.keymap.set("n", "<Leader>dso", dap.step_over, {})
      vim.keymap.set("n", "<Leader>dsu", dap.step_out, {})
      vim.keymap.set("n", "<Leader>dr", function()
        dap.repl.toggle()
      end)
      vim.keymap.set("n", "<Leader>df", function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.frames)
      end)

      vim.fn.sign_define("DapBreakpoint", { text="🛑", texthl="", numhl="" })
    end,
  },
  -- {
  --   -- "dreamsofcode-io/nvim-dap-go",
  --   "leoluz/nvim-dap-go",
  --   ft = "go",
  --   dependencies = "mfussenegger/nvim-dap",
  --   -- config = function(_, opts)
  --   --   require("dap-go").setup(opts)
  --   --end
  -- },
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
       "html", "css"
  		},
  	},
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function()
      return require "configs/none-ls"
    end
  },
}
