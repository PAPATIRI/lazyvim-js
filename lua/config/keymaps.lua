-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

-- Move highlighted lines up/down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- quit insert mode
map("i", "jj", "<Esc>", { desc = "quit insert mode" })
map("i", "jk", "<Esc>", { desc = "quit insert mode" })

-- buffer management
-- vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")
-- vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
-- vim.keymap.set("n", "<leader>bp", ":bprev<CR>")

-- Set default terminal to PowerShell
require("lazyvim.util.terminal").setup("pwsh")

-- floating terminal
local lazyterm = function()
  LazyVim.terminal(nil, {
    cwd = LazyVim.root(),
    size = { width = 0.7, height = 0.7 },
  })
end

map("n", "<leader>ft", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<leader>fT", function()
  LazyVim.terminal()
end, { desc = "Terminal (cwd)" })
map("n", "<c-/>", lazyterm, { desc = "Terminal (Root Dir)" })
map("n", "<c-_>", lazyterm, { desc = "which_key_ignore" })
