--[[
-- Bootstrap module, Assemable the entire architecture
-- 1. reset &rtp and &packpath, for customize external directory which we control to install somethings
-- 2. initialize config manager
-- 3. 
--]]

local M = {}

-- 1. Config manager for load every config module
require "standardpath"

-- 2. Config manager for load every config module
require "config"

-- 3. Install plugin manager for load plugins
require "plugin"

return M
