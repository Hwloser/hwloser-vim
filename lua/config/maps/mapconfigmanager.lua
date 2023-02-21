--[[
-- Map manager
-- Note that: If you want to change the key of defaultmaps.lua, you should check the modeabbrmap.lua firstly
--]]

require "common.utilities"

local M = {}

--[[
-- Functions here
--]]

-- 1. local default maps and mode->abbr map
local defaultMaps = require "config.maps.defaultmaps"

-- 2. Try locad default maps
LoadMapConfigs(defaultMaps)

-- 3. Specific maps define
-- to be continue

return M
