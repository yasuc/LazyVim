if false then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- vim.g.mapleader = " "
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
-- vim.opt.fileencodings = "iso-2022-jp,sjis,euc-jp,utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.fileformats = "unix,dos,mac"

vim.opt.title = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.scrolloff = 10

-- Check if 'pwsh' is executable and set the shell accordingly
if vim.fn.executable("cmd") == 1 then
  vim.o.shell = "cmd"
else
  vim.opt.shell = "zsh"
end

-- vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.breakindent = true
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*" })

-- vim.g.python3_host_prog = "/home/yasuc/.pyenv/shims/python3"

vim.opt.termguicolors = true
vim.opt.winblend = 0 -- ウィンドウの不透明度
vim.opt.pumblend = 0 -- ポップアップメニューの不透明度

vim.g.have_nerd_font = true
