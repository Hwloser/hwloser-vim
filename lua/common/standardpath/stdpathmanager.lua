--[[
-- The manager to define the &rtp path
-- 1. 
-- print(require("dkjson").encode())
--]]

local m = require("common.standardpath.standardpathdefination")


print(require("dkjson").encode(m))

print(require("dkjson").encode(vim.call("stdpath", "config_dirs")))
print(require("dkjson").encode(vim.call("stdpath", "data_dirs")))
