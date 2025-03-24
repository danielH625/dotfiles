return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.yapf.with({
          extra_args = { "--style", "{based_on_style: pep8, indent_width: 2}" },
        }),                                -- Python
        null_ls.builtins.formatting.isort, -- Python import sorting
        null_ls.builtins.formatting.prettier, -- JS/HTML/CSS
        null_ls.builtins.formatting.stylua, -- Lua
        null_ls.builtins.formatting.shfmt, -- Bash
        null_ls.builtins.formatting.goimports, -- Golang
        null_ls.builtins.formatting.asmfmt, -- Assembly
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    -- Autocommand to format the file automatically on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",                      -- You can customize this to specific file types if needed
      callback = function()
        vim.lsp.buf.format({ async = false }) -- Synchronously format before save
      end,
    })
  end,
}
