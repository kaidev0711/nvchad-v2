local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
  pattern = "*",
  command = "tabdo wincmd =",
})

autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.opt.statusline = "%#normal# "
  end,
})

local opt = vim.opt
opt.cmdheight = 0
-- opt.guicursor = a
-- opt.cursorline = true

require "custom.configs.format_onsave"

local lpath = vim.fn.stdpath "config" .. "/lua/custom/my-snippets"
vim.g.vscode_snippets_path = lpath
vim.g.snipmate_snippets_path = lpath

--python
local enable_providers = {
  "python3_provider",
  "python3",
  "node_provider",
}

-- vim.g.python3_host_prog = "~/.pyenv/versions/3.10.6/bin/python"

-- Check if pyenv is installed
if vim.fn.executable "pyenv" == 1 then
  -- Set the path to the default Python executable managed by Pyenv
  vim.g.python3_host_prog = os.getenv "HOME" .. "/.pyenv/versions/3.10.6/bin/python3"

  -- Check if a virtual environment is active
  local virtualenv = vim.env.VIRTUAL_ENV
  if virtualenv ~= nil then
    -- Set the path to the Python executable within the virtual environment
    local python_path = virtualenv .. "/bin/python"
    vim.g.python3_host_prog = python_path
  end
  -- else
  -- Set the path to the default Python executable on your system
  -- vim.g.python3_host_prog = 'python3'
end

for _, plugin in pairs(enable_providers) do
  vim.g["loaded_" .. plugin] = nil
  vim.cmd("runtime " .. plugin)
end
-- autocmd("VimEnter",{
--   pattern="*",
--   command="Nvdash",
-- })

-- autocmd("WinEnter", {
--    pattern = "*",
--    callback = function()
--       if vim.bo.buftype ~= "terminal" then
--          vim.opt.statusline = "%!v:lua.require'ui.statusline'.run()"
--       else
--          vim.opt.statusline = "%#normal# "
--       end
--    end,
-- })
