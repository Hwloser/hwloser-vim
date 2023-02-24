--[[
-- The manager to define the &rtp path and &packpath
--
-- debug functions
--   local packpath = vim.api.nvim_get_option('packpath')
--   print(require("dkjson").encode(Split(packpath, ",")))
--   print(require("dkjson").encode(m))
--   print(require("dkjson").encode(vim.call("stdpath", "config_dirs")))
--   print(require("dkjson").encode(vim.call("stdpath", "data_dirs")))
--]]

require "common.utilities"

-- 1. ready to reset the path「where will load config, plugins, cache」
local originPaths = require("standardpath.standardpathdefination")
local resetPaths = require("standardpath.resetpath")

-- 2. override the stdpath,
-- let the context to load
--   a. config
--   b. plugins
--   c. cache
-- from ourselvels`s path
vim.fn.stdpath = function(what)
  -- 1. Try get directory from the reset path
  local resetDir = resetPaths[what]
  if resetDir then
    return resetDir.directory
  end
  -- 2. Try get directory from origin path defitation
  -- TODO: is this usage?
  local originDir = originPaths[what]
  if originDir then
    return originDir.directory
  end
  -- 3. Default action from standard 「stdpath function」
  return vim.call("stdpath", what)
end

-- 3. Remove the data and config defination from &rtp
-- take care of these directory, because default neovim load plugins here
vim.opt.rtp:remove(originPaths["config"].directory)
vim.opt.rtp:prepend(resetPaths["base-lua"].directory)

vim.opt.rtp:remove(JoinSep(originPaths["config"].directory, "after"))
vim.opt.rtp:remove(JoinSep(originPaths["data"].directory, "site"))
vim.opt.rtp:remove(JoinSep(originPaths["data"].directory, "site", "after"))

vim.opt.packpath:remove(originPaths["config"].directory)
vim.opt.packpath:remove(JoinSep(originPaths["config"].directory, "after"))
vim.opt.packpath:remove(JoinSep(originPaths["data"].directory, "site"))
vim.opt.packpath:remove(JoinSep(originPaths["data"].directory, "site", "after"))

