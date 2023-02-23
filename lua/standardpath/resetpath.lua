--[[
-- The path that we should reset, to avoid other default plugin conflict
--]]

require "common.utilities"

-- 1. Get the parent directory in git module
local parrentDir = GetGitRootDirectory()

local externalParDir = Join(parrentDir, "external")

return {
  ["base-lua"] = {
    describe = "Just for load lua file which we customize define",
    directory = parrentDir
  },

  ["cache"] = {
    directory = Join(externalParDir, "cache", "nvim")
  },
  ["data"] = {
    directory = Join(externalParDir, "local", "share", "nvim")
  },
  ["config"] = {
    directory = Join(externalParDir, "config", "nvim")
  },
  ["log"] = {
    directory = Join(externalParDir, "state", "nvim")
  },
  ["package"] = {
    directory = Join(externalParDir, "local", "share", "nvim", "site", "pack")
  },
  ["site-after"] = {
    directory = Join(externalParDir, "local", "share", "nvim", "site", "after")
  },

  ["lazy-nvim-plugin"] = {
    describe = "nvim plugin manager,which is lazy.nvim",
    directory = Join(parrentDir, "external", "lazy.nvim")
  }
}
