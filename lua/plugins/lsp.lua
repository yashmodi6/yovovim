return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    -- disable semantic tokens to preserve treesitter highlights
    local on_init = function(client, _)
      if client.supports_method and client:supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
      end
    end

    vim.lsp.config("*", {
      capabilities = capabilities,
      on_init = on_init,
    })

    vim.lsp.config("vtsls", {
      settings = {
        complete_function_calls = true,
        vtsls = {
          enableMoveToFileCodeAction = true,
          autoUseWorkspaceTsdk = true,
          experimental = {
            completion = {
              enableServerSideFuzzyMatch = true,
            },
          },
        },
        typescript = {
          updateImportsOnFileMove = { enabled = "always" },
          suggest = {
            completeFunctionCalls = true,
          },
        },
        javascript = {
          updateImportsOnFileMove = { enabled = "always" },
          suggest = {
            completeFunctionCalls = true,
          },
        },
      },
    })

    vim.lsp.enable {
      "vtsls",
      "html",
      "cssls",
      "jsonls",
    }
  end,
}
