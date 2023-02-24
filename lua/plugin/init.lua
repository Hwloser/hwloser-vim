--[[
-- Plugin manager by lazy.nvim
-- please check the https://github.com/folke/lazy.nvim#-plugin-spec for more infomation
--]]

require "common.utilities"

-- 1. Initialize lazy.nvim plugin to &rtp
-- It`s defined in standardpath/resetpath.lua
vim.opt.rtp:prepend(vim.fn.stdpath('lazy-nvim-plugin'))

-- 2. Ready plugins
local plugins = MergeTable(
  require("plugin.backend"),
  require("plugin.frontend")
)

-- 3. read default config
local lazyConfig = require("config.lazy.default")

-- 4. load lazy.nvim
lazyConfig.spec = plugins
require("lazy").setup(lazyConfig)
