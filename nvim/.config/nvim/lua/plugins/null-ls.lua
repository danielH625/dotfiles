return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatters
        null_ls.builtins.formatting.yapf.with({
          extra_args = { "--style", "{based_on_style: pep8, indent_width: 2}" },
        }),                               -- Python
        null_ls.builtins.formatting.isort, -- Python import sorting
        null_ls.builtins.formatting.prettier, -- JS/HTML/CSS
        null_ls.builtins.formatting.stylua, -- Lua

        -- Linters (Optional)
        null_ls.builtins.diagnostics.eslint_d, -- JS linter
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end,
    })
  end,
}
