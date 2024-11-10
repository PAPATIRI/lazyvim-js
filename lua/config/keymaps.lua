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

-- Set default terminal to PowerShell
local function get_terminal_config()
  local os_name
  if vim.fn.has("win32") == 1 then
    os_name = "Windows"
  elseif vim.fn.has("unix") == 1 then
    os_name = "Unix"
  else
    os_name = "Unknown"
  end

  if os_name == "Windows" then
    return "pwsh"
  elseif os_name == "Unix" then
    if vim.fn.executable("zsh") == 1 then
      return { cmd = "zsh" }
    else
      return { cmd = "bash" }
    end
  else
    -- Default to bash for other operating systems
    return "bash"
  end
end

local terminal_config = get_terminal_config()

if type(terminal_config) == "string" then
  require("lazyvim.util.terminal").setup(terminal_config)
elseif type(terminal_config) == "table" then
  require("lazyvim.util.terminal").setup(terminal_config.cmd, terminal_config.args)
else
  vim.notify("Invalid terminal configuration", vim.log.levels.ERROR)
end
