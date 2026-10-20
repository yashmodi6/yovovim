return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local ok, palette = pcall(require, "oxide.colors")
      local colors = ok and palette.setup().colors or {}

      return {
        options = {
          component_separators = "",
          section_separators = "",
          disabled_filetypes = { statusline = { "snacks_dashboard" } },
        },
        sections = {
          lualine_a = {},
          lualine_b = { "branch" },
          lualine_c = {
            { "filename", path = 1 },
            {
              "diff",
              colored = true,
              diff_color = {
                added = { fg = colors.bright_green },
                modified = { fg = colors.bright_orange },
                removed = { fg = colors.bright_red },
              },
            },
          },
          lualine_x = {
            {
              "diagnostics",
              symbols = {
                error = "󰅚 ",
                warn = "󰀪 ",
                info = "󰋽 ",
                hint = "󰠠 ",
              },
            },
            -- LSP status
            {
              function()
                local clients = vim.lsp.get_clients { bufnr = 0 }
                if #clients == 0 then
                  return ""
                end
                local names = {}
                for _, client in ipairs(clients) do
                  table.insert(names, client.name)
                end
                return " " .. table.concat(names, ", ")
              end,
              color = { fg = colors.bright_blue },
            },
            -- Formatter status
            {
              function()
                local has_conform, conform = pcall(require, "conform")
                if not has_conform then
                  return ""
                end
                local formatters = conform.list_formatters(0)
                if #formatters == 0 then
                  return ""
                end
                local names = {}
                for _, formatter in ipairs(formatters) do
                  table.insert(names, formatter.name)
                end
                return "󱡂 " .. table.concat(names, ", ")
              end,
              color = { fg = colors.bright_teal },
            },
          },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
}
