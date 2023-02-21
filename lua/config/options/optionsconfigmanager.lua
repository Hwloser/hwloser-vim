--[[
-- Options Config Managers
-- 1. load default options in defaultoptions.lua
--
--]]

local M = {}

-- 1. set default options
local defaultOptions = require "config.options.defaultoptions"

-- 2. load default options
for k, v in pairs(defaultOptions) do
  vim.opt[k] = v
end

return M
