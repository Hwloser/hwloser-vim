-- Config Manager

local M = {}

-- 1. Override the default standard path
-- Avoid conflict with the default standard-path「please check with :h standard-path」
-- So we override the default configuration path


-- 2. Options manager
require "config.options.optionsconfigmanager"

-- 3. Map manager
require "config.maps.mapconfigmanager"

return M
