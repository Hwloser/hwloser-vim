--[[
-- Backend manager
--]]

require "common.utilities"

---@param sub string
local function join(sub)
  return "plugin.backend." .. sub
end

---@param keys string[]
local function load(keys)
  local r = {}
  for k, v in pairs(keys) do
    r[k] = require(join(v))
  end
  return r
end

---the directory of current script file
---@return string
local function scriptDirectory()
  local path = debug.getinfo(2, "S").source:sub(2)
  return vim.fn.fnamemodify(path, ":p:h")
end

-- 1. Try get plugins under backend
local plugins = ListFiles(scriptDirectory(), "%.lua$")

-- 2. Filter init.lua
for i = #plugins, 1, -1 do
  if plugins[i] == 'init' then
    table.remove(plugins, i)
  end
end

-- return plugin spec
return load(plugins)
