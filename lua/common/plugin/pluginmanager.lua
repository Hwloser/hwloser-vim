--[[
-- Plugin manager
--]]

-- 1. load default plugin configs
local defaultPlugins = require "common.plugin.defaultplugins"


-- cache        String  Cache directory: arbitrary temporary
--                      storage for plugins, etc.
-- config       String  User configuration directory. |init.vim|
--                      is stored here.
-- config_dirs  List    Other configuration directories.
-- data         String  User data directory.
-- data_dirs    List    Other data directories.
-- log          String  Logs directory (for use by plugins too).
-- run          String  Run directory: temporary, local storage
--          for sockets, named pipes, etc.
-- state        String  Session state directory: storage for file
--          drafts, swap, undo, |shada|.

-- print(require("dkjson").encode(vim.fn.stdpath "config"))
-- print(require("dkjson").encode(vim.fn.stdpath "config_dirs"))
-- print(require("dkjson").encode(vim.fn.stdpath "data"))
-- print(require("dkjson").encode(vim.fn.stdpath "data_dirs"))
-- print(require("dkjson").encode(vim.fn.stdpath "log"))
-- print(require("dkjson").encode(vim.fn.stdpath "run"))
-- print(require("dkjson").encode(vim.fn.stdpath "state"))
-- "/Users/huanwei/.config/nvim"
-- ["/opt/homebrew/etc/xdg/nvim","/etc/xdg/nvim"]
-- "/Users/huanwei/.local/share/nvim"
-- ["/opt/homebrew/share/nvim","/usr/local/share/nvim","/usr/share/nvim"]
-- "/Users/huanwei/.local/state/nvim"
-- "/var/folders/b3/4q661ppd661bz6wm737qt5w00000gn/T/nvim.huanwei/ba8SrF"
-- "/Users/huanwei/.local/state/nvim"
--
