-- custom/configs/rust-tools.lua
-- local on_attach = require("plugins.congfig.lspconfig").on_attach
-- local opts = {
--   server = {
--     on_attach = on_attach,
--     settings = {
--       ["rust-analyzer"] = {
--         cargo = {
--           allFeatures = true,
--         },
--         procMacro = {
--           enable = true,
--         },
--       },
--     },
--   },
-- }
-- return opts

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
  tools = {
    autoSetHints = true,
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      show_parameter_hints = true,
      parameter_hints_prefix = "🤔 ",
      other_hints_prefix = "🔍 ",
    },
    hover_actions = {

      -- the border that is used for the hover window
      -- see vim.api.nvim_open_win()
      border = {
        { "╭", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╮", "FloatBorder" },
        { "│", "FloatBorder" },
        { "╯", "FloatBorder" },
        { "─", "FloatBorder" },
        { "╰", "FloatBorder" },
        { "│", "FloatBorder" },
      },
    },
  }
})
