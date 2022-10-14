local Log = require "lvim.core.log"
local init_path = debug.getinfo(1, "S").source:sub(2)
local base_dir = init_path:match("(.*[/\\])"):sub(1, -2)

-- 将当前目录（项目根目录添加到rtp下面）
if not vim.tbl_contains(vim.opt.rtp:get(), base_dir) then
  vim.opt.rtp:append(base_dir)
end

-- 1. 加载bootstrap模块
require("lvim.bootstrap"):init(base_dir)
-- 2. 加载配置文件
require("lvim.config"):load()

-- 3. 加载插件
require("lvim.plugin-loader").load { 
  require("lvim.plugins"), 
  lvim.plugins 
}

-- require("lvim.core.log"):debug("Starting LunarVim")
-- require("lvim.core.commands").load(commands.defaults)
require("lvim.lsp").setup()
