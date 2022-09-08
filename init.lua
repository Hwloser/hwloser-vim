local core_config_files = {
  "globals.vim", -- global settings
  "options.vim", -- setting options here
  "autocommands.vim", -- various autocommands
  "mappings.lua", -- all the the user-defined mappings
  "plugins.vim", -- all the plugins installed and their configurations
  "colorschemes.lua", -- colorschemes settings
}

for _, name in ipairs(core_config_files) do
  local path = string.format("%s/core/%s", vim.fn.stdpath('config'), name)
  local source_cmd = "source " .. path
  vim.cmd(source_cmd)
end
