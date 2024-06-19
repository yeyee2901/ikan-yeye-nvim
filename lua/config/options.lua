-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local my_options = {
  relativenumber = false,
  encoding = "utf8",
  number = true,
  clipboard = "unnamed", -- on mac, it requires pbcopy
  mouse = "",
  swapfile = false,
  smartindent = true,
  smarttab = true,
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4, -- Default
  wrap = false,
  ignorecase = true,
  timeout = true,
  timeoutlen = 300,
  updatetime = 300,
  hlsearch = false,
  hidden = true,
  termguicolors = true,
  cursorline = false,
  inccommand = "split",
  signcolumn = "yes",
  colorcolumn = "0",
  splitbelow = true,
  splitright = true,
  laststatus = 3,
  winbar = "%f",
}

-- set all options
for option, value in pairs(my_options) do
  vim.opt[option] = value
end
