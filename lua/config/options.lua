-- Keep only intentional overrides of LazyVim's defaults.
local opt = vim.opt

opt.title = true
opt.scrolloff = 10
opt.fileencodings = { "utf-8" }
opt.fileformats = { "unix", "dos", "mac" }
opt.inccommand = "split"
opt.breakindent = true
opt.winblend = 0
opt.pumblend = 0
opt.path:append("**")
opt.wildignore:append("*/node_modules/*")

if vim.fn.has("win32") == 0 and vim.fn.executable("zsh") == 1 then
  opt.shell = vim.fn.exepath("zsh")
end
