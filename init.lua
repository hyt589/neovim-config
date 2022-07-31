-- easy access to config files
local info = debug.getinfo(1,'S');
local thisFile = string.sub(info.source, 2)

vim.api.nvim_create_user_command(
  'NvimConfig',
  'e ' .. thisFile,
  {bang = true}
)

vim.api.nvim_create_user_command(
  'ReloadNvimConfig',
  'source ' .. thisFile,
  {bang = true}
)

require('plugins')
