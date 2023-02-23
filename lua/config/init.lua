-- Config Manager

local M = {}

-- 1. Options manager
require "config.options"

-- 2. Map manager
require "config.maps"

-- 3. Autocommand manager
require "config.commands"

-- 4. global variables manager
-- require "config.variables"
vim.g.mapleader = " "

-- 5. Snippest manager
require "config.snippest"

return M
