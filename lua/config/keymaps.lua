if false then
  return {}
end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- set leader key to space
local opts = { noremap = true, silent = true }

local keymap = vim.keymap -- for conciseness

-- General Keymaps -------------------

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Diagnostics
keymap.set("n", "<C-d>", function()
  vim.diagnostic.goto_next()
end, opts)

-- Normal --
-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", opts)
keymap.set("n", "<C-j>", "<C-w>j", opts)
keymap.set("n", "<C-k>", "<C-w>k", opts)
keymap.set("n", "<C-l>", "<C-w>l", opts)

-- 行末までのヤンクにする
keymap.set("n", "Y", "y$", opts)

-- ESC*2 でハイライトやめる
keymap.set("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", opts)

-- Visual --
-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- ビジュアルモード時vで行末まで選択
keymap.set("v", "v", "$h", opts)

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- insert mode での移動
keymap.set("i", "<C-e>", "<END>", opts)
keymap.set("i", "<C-a>", "<HOME>", opts)
keymap.set("i", "<C-n>", "<Down>", opts)
keymap.set("i", "<C-p>", "<Up>", opts)
keymap.set("i", "<C-b>", "<Left>", opts)
keymap.set("i", "<C-f>", "<Right>", opts)

-- jqa
keymap.set("n", ",r", ":Jaq quickfix<Return>", opts)

-- 文字コードの変更
keymap.set("n", "<Leader>U", "", { desc = " Convert char code" })
keymap.set("n", "<leader>Uu", ":e ++enc=utf-8<Return>", { silent = true, desc = "convert to utf-8" })
keymap.set("n", "<leader>Us", ":e ++enc=sjis<Return>", { silent = true, desc = "convert to sjis" })

-- keymap.set("n", "<Leader>;", "<Cmd>CodeiumToggle<CR>", {noremap = true, desc = "Toggle Codeium active" })
-- keymap.set("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, {expr = true})
-- keymap.set("i", "<C-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, {expr = true, })
-- keymap.set("i", "<C-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, {expr = true, })
-- keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, {expr = true,})
