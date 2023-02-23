--[[
-- The path that we should reset, to avoid other default plugin conflict
--]]

require "common.utilities"

-- 1. Get the parent directory in git module
local parrentDir = GetGitRootDirectory()

local externalParDir = JoinSep(parrentDir, "external")

return {
  ["base-lua"] = {
    describe = "Just for load lua file which we customize define",
    directory = parrentDir
  },

  ["cache"] = {
    directory = JoinSep(externalParDir, "cache", "nvim")
  },
  ["data"] = {
    directory = JoinSep(externalParDir, "local", "share", "nvim")
  },
  ["config"] = {
    directory = JoinSep(externalParDir, "config", "nvim")
  },
  ["log"] = {
    directory = JoinSep(externalParDir, "state", "nvim")
  },
  ["package"] = {
    directory = JoinSep(externalParDir, "local", "share", "nvim", "site", "pack")
  },
  ["site-after"] = {
    directory = JoinSep(externalParDir, "local", "share", "nvim", "site", "after")
  },

  ["lazy-nvim-plugin"] = {
    describe = "nvim plugin manager,which is lazy.nvim",
    directory = JoinSep(parrentDir, "external", "lazy.nvim")
  }
}
