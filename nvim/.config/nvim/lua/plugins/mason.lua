return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- Set up mason.nvim
    require("mason").setup()

    -- Set up mason-lspconfig with automatic installation
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        -- LSP servers
        "bashls", -- Bash
        "pyright", -- Python
        "gopls", -- Go
        "html", -- HTML
        "cssls", -- CSS
        "lua_ls", -- Lua
        "asm_lsp", -- Assembly
      },
    })

    -- Set up mason-tool-installer for any additional tools (e.g., formatters)
    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier", -- JS/HTML/CSS formatter
        "stylua", -- Lua formatter
        "yapf",  -- Python formatter
        "isort", -- Python import sorter
        "eslint_d", -- JS linter
        "asmfmt", -- Assembly formatter
        "shfmt", -- Bash formatter
        "goimports", -- Go formatter
      },
    })
  end,
}
