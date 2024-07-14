local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require "lspconfig/util"

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = { "go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

local on_attach_r = function(client, bufnr)
  vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  require'completion'.on_attach(client)
end

lspconfig.rust_analyzer.setup {
  on_attach = on_attach_r,
  capabilities = capabilities,
  filetypes = { "rust" },
  -- root_dir = util.root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  -- on_attach = function(client, bufnr)
  --       -- Set colorcolumn=79 only for Python files
  --       if vim.api.nvim_buf_get_option(bufnr, 'filetype') == 'python' then
  --           vim.api.nvim_buf_set_option(bufnr, 'colorcolumn', '79')
  --       end
  --
  --       -- Attach the on_attach function for other general configurations
  --       on_attach(client, bufnr)
  -- end,
  capabilities = capabilities,
  -- cmd = {"pyright-langserver", "--stdio"},
  filetypes = { "python" },
  -- root_dir = util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt"),
}

