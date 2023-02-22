--[[
-- The standard path defination

the content of stdpath function:

  {what}       Type    Description ~
  cache        String  Cache directory: arbitrary temporary
                       storage for plugins, etc.
  config       String  User configuration directory. |init.vim|
                       is stored here.
  config_dirs  List    Other configuration directories.
  data         String  User data directory.
  data_dirs    List    Other data directories.
  log          String  Logs directory (for use by plugins too).
  run          String  Run directory: temporary, local storage
           for sockets, named pipes, etc.
  state        String  Session state directory: storage for file
           drafts, swap, undo, |shada|.

  Example: >
    :echo stdpath("config")

Some real example here:

1. The table under defination
{
    "package":
    {
        "directory": "/Users/huanwei/.local/share/nvim/site/pack",
    },
    "log":
    {
        "directory": "/Users/huanwei/.local/state/nvim",
    },
    "config":
    {
        "directory": "/Users/huanwei/.config/nvim",
    },
    "site-after":
    {
        "directory": "/Users/huanwei/.local/share/nvim/site/after",
    },
    "data":
    {
        "directory": "/Users/huanwei/.local/share/nvim",
    },
    "cache":
    {
        "directory": "/Users/huanwei/.cache/nvim",
    }
}

2. The real defination here
[
"/Users/huanwei/.config/nvim", 
"/Users/huanwei/.config/nvim/after"
"/Users/huanwei/.local/share/nvim/site",
"/Users/huanwei/.local/share/nvim/site/after",

"/etc/xdg/nvim",
"/etc/xdg/nvim/after",

"/usr/local/share/nvim/site",
"/usr/local/share/nvim/site/after",

"/usr/share/nvim/site",
"/usr/share/nvim/site/after",

"/opt/homebrew/etc/xdg/nvim",
"/opt/homebrew/etc/xdg/nvim/after",
"/opt/homebrew/Cellar/neovim/HEAD-f905ab0/lib/nvim",
"/opt/homebrew/Cellar/neovim/HEAD-f905ab0/share/nvim/runtime",
"/opt/homebrew/share/nvim/site",
"/opt/homebrew/share/nvim/site/after",
]

--]]

require "common.utilities"

local stdp = function(define)
  return vim.call("stdpath", define)
end

local M = {
  ["cache"] = {
    describe = "you could call :echo stdpath(\"cache\") to check the define",
    directory = stdp("cache"),
  },

  ["data"] = {
    describe = "you could call :echo stdpath(\"data\") to check the define",
    directory = stdp("data"),
  },

  ["config"] = {
    describe = "you could call :echo stdpath(\"config\") to check the define",
    directory = stdp("config"),
  },


  ["log"] = {
    describe = "you could call :echo stdpath(\"config\") to check the define",
    directory = stdp("log"),
  },
}

-- There we define extension of above
local extension = {
  ["package"] = {
    describe = "the extension of packages dir, under the stdpath(\"data\")/site/pack",
    directory = Join(M["data"].directory, "site", "pack"),
  },

  ["site-after"] = {
    describe = "plugin load path, lifestyle in after",
    directory = Join(M["data"].directory, "site", "after"),
  },

}

return SimpleMergeInLeft(M, extension)
