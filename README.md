# YovoVim

Modern, minimalist Neovim configuration built for performance.

---

## 🚀 Installation

Make sure to back up or remove any existing Neovim configuration before proceeding.

### Linux / macOS / Android (Termux)
```bash
git clone https://github.com/yashmodi6/yovovim.git ~/.config/nvim && nvim
```

### Windows (PowerShell)
```powershell
git clone https://github.com/yashmodi6/yovovim.git $env:LOCALAPPDATA\nvim; nvim
```

### Windows (CMD)
```cmd
git clone https://github.com/yashmodi6/yovovim.git %LOCALAPPDATA%\nvim && nvim
```

---

## 🗑️ Uninstallation

To completely remove the configuration and its cached data:

### Linux / macOS / Android (Termux)
```bash
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim
```

### Windows (PowerShell)
```powershell
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim, $env:LOCALAPPDATA\nvim-data
```

### Windows (CMD)
```cmd
rmdir /s /q "%LOCALAPPDATA%\nvim"
rmdir /s /q "%LOCALAPPDATA%\nvim-data"
```

---

## 📦 Plugins

### Package Manager
* [folke/lazy.nvim](https://github.com/folke/lazy.nvim)

### Theme & UI
* [oxidescheme/nvim](https://github.com/oxidescheme/nvim)
* [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
* [folke/snacks.nvim](https://github.com/folke/snacks.nvim)
* [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

### Completion
* [saghen/blink.cmp](https://github.com/saghen/blink.cmp)

### LSP & Syntax
* [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [brenoprata10/nvim-highlight-colors](https://github.com/brenoprata10/nvim-highlight-colors)
* [MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)

### Editing & Formatting
* [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)
* [windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
* [NMAC427/guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim)
* [echasnovski/mini.move](https://github.com/echasnovski/mini.move)
* [echasnovski/mini.pairs](https://github.com/echasnovski/mini.pairs)
* [kevinhwang91/nvim-ufo](https://github.com/kevinhwang91/nvim-ufo)
* [kevinhwang91/promise-async](https://github.com/kevinhwang91/promise-async)

### Git & Session
* [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
* [folke/persistence.nvim](https://github.com/folke/persistence.nvim)
