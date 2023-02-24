local global = require "config.variables.global"

for k, v in ipairs(global) do
  vim.g[k] = v
end

