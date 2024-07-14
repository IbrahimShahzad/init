local M = {}

-- Define the function to open the sidebar
local function open_debugging_sidebar()
  local widgets = require('dap.ui.widgets')
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at the line"
    },
    ["<leader>dus"] = {
      function ()
        open_debugging_sidebar()
      end,
    }
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function ()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function ()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    },
  }
}

-- run rust code in debug mode
-- M.dap_rust = {
--   plugin = true,
--   n = {
--     ["<leader>dr"] = {
--       function ()
--         require('dap-rust').debug()
--       end,
--       "Debug rust code"
--     },
--   }
-- }

M.crates = {
  n = {
    ["<leader>rcu"] = {
      function ()
        require('crates').upgrade_all_crates()
      end,
      "Upgrade all crates"
    },
  }
}
return M
