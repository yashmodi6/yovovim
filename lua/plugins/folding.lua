return {
  "kevinhwang91/nvim-ufo",
  dependencies = { "kevinhwang91/promise-async" },
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    provider_selector = function(bufnr, filetype, buftype)
      return { "lsp", "indent" }
    end,
    fold_virt_text_handler = function(virtText, lnum, endLnum)
      table.insert(virtText, { (" 󰁂 %d "):format(endLnum - lnum), "MoreMsg" })
      return virtText
    end,
  },
}
