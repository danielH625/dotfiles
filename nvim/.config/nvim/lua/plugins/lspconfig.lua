return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local nvim_lsp = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Basic on_attach function for LSP servers (no formatting)
    local on_attach = function(client, bufnr) end

    -- Set up the LSP servers with mason-lspconfig
    mason_lspconfig.setup_handlers({
      -- Default handler for all LSP servers
      function(server)
        nvim_lsp[server].setup({
          capabilities = capabilities,
          on_attach = on_attach, -- No formatting here, handled by none-ls
        })
      end,

      -- Specific server customizations (if needed)
      ["bashls"] = function()
        nvim_lsp["bashls"].setup({
          on_attach = on_attach, -- No formatting here
          capabilities = capabilities,
        })
      end,
      ["pyright"] = function()
        nvim_lsp["pyright"].setup({
          on_attach = on_attach, -- No formatting here
          capabilities = capabilities,
        })
      end,
      ["gopls"] = function()
        nvim_lsp["gopls"].setup({
          on_attach = on_attach, -- No formatting here
          capabilities = capabilities,
        })
      end,
      ["html"] = function()
        nvim_lsp["html"].setup({
          on_attach = on_attach, -- No formatting here
          capabilities = capabilities,
        })
      end,
      ["cssls"] = function()
        nvim_lsp["cssls"].setup({
          on_attach = on_attach, -- No formatting here
          capabilities = capabilities,
        })
      end,
      ["lua_ls"] = function()
        nvim_lsp["lua_ls"].setup({
          on_attach = on_attach, -- No formatting here
          capabilities = capabilities,
        })
      end,
      ["asm_lsp"] = function()
        nvim_lsp["asm_lsp"].setup({
          on_attach = on_attach, -- No formatting here
          capabilities = capabilities,
        })
      end,
    })
  end,
}
