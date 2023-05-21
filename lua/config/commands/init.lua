--[[
-- autocommand config manager
--]]

local M = {}

-- 1. local default autocommands
local defaultCommands = require "config.commands.defaultcommands"

-- 2. Load auto command groups
require 'config.commands.autocommands'

return M
