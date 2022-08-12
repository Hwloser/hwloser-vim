-- define global variables
local is_mac = require("core.global").is_mac
local modules_dir = require("core.global").modules_dir

-- define function reference
local fn, uv, api = vim.fn, vim.loop, vim.api

-- define global variables
packer = nil

local Packer = {}
Packer.__index = Packer

-- 1. define method in Packer
function Packer:load_plugins()
  self.repos = {}

  -- 1. get plugin files
  local plugin_files = {}
  local _plugin_files = vim.split(fn.globpath(modules_dir, "*/plugins.lua"), "\n")
  for _, file_name in ipairs(_plugin_files) do
    plugin_files[#plugin_files + 1] = file_name:sub(#modules_dir - 6, -1)
  end

  -- 2. init plugins
  for _, m in ipairs(plugin_files) do
    local _repos = require(m:sub(0, #m - 4))
    for repo, conf in pairs(_repos) do
      self.repos[#self.repos + 1] = vim.tbl_extend("force", { repo }, conf)
    end
  end
end

function Packer:load_packer()
  if not packer then
    api
