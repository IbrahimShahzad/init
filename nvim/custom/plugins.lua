return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed= {
        "rust-analyzer",
        "gopls",
        "pyright",
        "black",
        "ruff",
        "mypy",
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    init = function ()
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"go", "python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_, opts)
      require("gopher").setup(opts)
    end,
    build = function ()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },
  {
    "github/copilot.vim",
     event = "VimEnter"
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    event = "VimEnter",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
  {
    "lewis6991/gitsigns.nvim",
    init = function ()
      require('gitsigns').setup()
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    init = function ()
      require("todo-comments").setup()
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    -- opts = function ()
    --   return require "custom.configs.rust-tools"
    -- end,
    -- config = function (_, opts)
    --   require('rust-tools').setup(opts)
    -- end,
    init = function()
      require "custom.configs.rust-tools"
    end,
  },
  -- {
  --   "saecki/crates.nvim",
  --   dependencies = "hrsh7th/nvim-cmp",
  --   ft = { "rust", "toml" },
  --   config = function (_, opts)
  --     local crates = require("crates")
  --     crates.setup(opts)
  --     crates.show()
  --   end,
  -- },
  {
    "hrsh7th/nvim-cmp",
    -- config = function ()
    --   local M = require "plugins.configs.cmp"
    --   table.insert(M.sources, { name = "crates" })
    --   return M
    -- end,
    config = function ()
      local cmp = require("cmp")
      local cmp_config = require("plugins.configs.cmp")
      cmp.setup(cmp_config)
    end,

  },
}
