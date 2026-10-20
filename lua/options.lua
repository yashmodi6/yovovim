local opt = vim.opt
local g = vim.g

-- Global flags
g.snacks_animate = false

-- Disable default provider detection
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Line numbers & cursor
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.cursorlineopt = "number"
opt.scrolloff = 8
opt.smoothscroll = true
opt.virtualedit = "block"
opt.signcolumn = "yes"

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.wrap = false
opt.linebreak = true
opt.breakindent = true
opt.formatoptions:append "r"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Appearance
opt.termguicolors = true
opt.showmode = false
opt.ruler = false
opt.shortmess:append "sI"
opt.laststatus = 3

opt.fillchars = {
  eob = " ",
  fold = " ",
  foldopen = "",
  foldsep = " ",
  foldinner = " ",
  foldclose = "",
}

-- Folds
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

-- Splits
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"

-- System
opt.clipboard = "unnamedplus"
opt.updatetime = 200
opt.timeoutlen = 300
opt.undofile = true
opt.swapfile = false
opt.mouse = "a"
opt.confirm = true
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

-- Diagnostics
vim.diagnostic.config {
  virtual_text = {
    prefix = "●",
    spacing = 2,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
}
