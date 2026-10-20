return {
  "saghen/blink.cmp",
  version = "1.*",
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {
    appearance = { nerd_font_variant = "normal" },
    fuzzy = { implementation = "prefer_rust" },
    cmdline = { enabled = true },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
    keymap = {
      preset = "default",
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    },
    completion = {
      menu = {
        border = "single",
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "single",
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        border = "single",
      },
    },
  },
  config = function(_, opts)
    require("blink.cmp").setup(opts)

    local function set_highlights()
      local ok, palette = pcall(require, "oxide.colors")
      if not ok then
        return
      end
      local colors = palette.setup().colors

      -- Darker, subtly elevated background (between oxide base #161616 and surface0 #222222)
      local menu_bg = "#1a1a1a"

      vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = menu_bg, fg = colors.text })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = colors.surface2, bg = menu_bg })
      vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = colors.surface0, fg = colors.text })
      vim.api.nvim_set_hl(0, "BlinkCmpScrollBarThumb", { bg = colors.surface2 })
      vim.api.nvim_set_hl(0, "BlinkCmpScrollBarGutter", { bg = menu_bg })

      vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = menu_bg, fg = colors.text })
      vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = colors.surface2, bg = menu_bg })
      vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { fg = colors.surface2, bg = menu_bg })

      vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelp", { bg = menu_bg, fg = colors.text })
      vim.api.nvim_set_hl(0, "BlinkCmpSignatureHelpBorder", { fg = colors.surface2, bg = menu_bg })

      -- Suggestion labels: neutral text with colored fuzzy search match letters
      vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = colors.text })
      vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = colors.bright_blue, bold = true })
      vim.api.nvim_set_hl(0, "BlinkCmpLabelDetail", { fg = colors.subtext0 })
      vim.api.nvim_set_hl(0, "BlinkCmpLabelDescription", { fg = colors.subtext1 })
      vim.api.nvim_set_hl(0, "BlinkCmpSource", { fg = colors.subtext1 })
      vim.api.nvim_set_hl(0, "BlinkCmpGhostText", { fg = colors.subtext2 })

      local kind_colors = {
        Class = colors.bright_yellow,
        Color = colors.bright_pink,
        Constant = colors.bright_orange,
        Constructor = colors.bright_teal,
        Enum = colors.bright_yellow,
        EnumMember = colors.bright_teal,
        Event = colors.bright_purple,
        Field = colors.bright_green,
        File = colors.bright_blue,
        Folder = colors.bright_blue,
        Function = colors.bright_blue,
        Interface = colors.bright_yellow,
        Keyword = colors.bright_pink,
        Method = colors.bright_blue,
        Module = colors.bright_purple,
        Operator = colors.bright_pink,
        Property = colors.bright_green,
        Reference = colors.bright_purple,
        Snippet = colors.bright_orange,
        Struct = colors.bright_yellow,
        Text = colors.subtext0,
        TypeParameter = colors.bright_yellow,
        Unit = colors.bright_lime,
        Value = colors.bright_orange,
        Variable = colors.bright_teal,
      }

      vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = colors.bright_blue })
      for kind, color in pairs(kind_colors) do
        if color then
          vim.api.nvim_set_hl(0, "BlinkCmpKind" .. kind, { fg = color })
        end
      end
    end

    set_highlights()
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = set_highlights,
    })
  end,
}   
