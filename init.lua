-- easy access to config files
local info = debug.getinfo(1,'S');
local thisFile = string.sub(info.source, 2)
local configDir = string.sub(thisFile, 1, string.len(thisFile) - 8)


local function ChangeRootToConfigDir()
  local api = require("nvim-tree.api")
  api.tree.change_root(configDir)
  vim.cmd('NvimTreeOpen')
end

local function OpenNvimConfig()
    vim.cmd('e ' .. thisFile)
end

vim.api.nvim_create_user_command(
  'OpenNvimConfig',
  OpenNvimConfig,
  {bang = true}
)

vim.api.nvim_create_user_command(
  'OpenConfigDir',
  ChangeRootToConfigDir,
  {bang = true}
)

vim.api.nvim_create_user_command(
  'ReloadNvimConfig',
  'source ' .. thisFile,
  {bang = true}
)

require('plugins')

