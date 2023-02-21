--[[
-- Bootstrap module, Assemable the entire architecture
-- 1. initialize config manager
-- 2. 
--]]

local M = {}

-- 1. Config manager for load every config module
require "common.standardpath.stdpathmanager"

-- 2. Config manager for load every config module
require("config.configmanager")

-- 3. Install plugin manager for load plugins
local pluginManager = require "common.plugin.pluginmanager"

return M
