local global = require "config.variables.global"

-- 1. Defination of global variables
for k, v in ipairs(global) do
  vim.g[k] = v
end

-- 2. The other of variables

