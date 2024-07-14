function Python_setup()
  local null_ls = require("null-ls")
  local sources = {}
  table.insert(sources, null_ls.builtins.formatting.black.with({
                extra_args = {
                    "--line-length=79",
                    -- "--skip-string-normalization",  -- Prevents black from rewrapping docstrings
                    "--experimental-string-processing",  -- Enable experimental string processing
                },
                filetypes = { "python" },  -- Apply only to Python files
            }))
  -- table.insert(sources, null_ls.builtins.formatting.isort)
  table.insert(sources, null_ls.builtins.diagnostics.mypy)
  table.insert(sources, null_ls.builtins.diagnostics.ruff)
  return sources
end

function Golang_setup()
  local null_ls = require("null-ls")
  local sources = {}
  table.insert(sources, null_ls.builtins.formatting.gofumpt)
  table.insert(sources, null_ls.builtins.formatting.goimports_reviser)
  table.insert(sources, null_ls.builtins.formatting.golines)
  return sources
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local sources = {}
-- sources in case file type is python
if vim.bo.filetype == "python" then
  sources = Python_setup()
elseif vim.bo.filetype == "go" then
  sources = Golang_setup()
end

local opts = {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}

return opts
-- require("null-ls").setup(opts)

