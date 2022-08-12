local global = require("core.global")
local vim = vim

-- 1. define leader key
function leader_map()
  vim.g.mapleader = " "
  vim.api.nvim_set_keymap("n", " ", "", { noremap = true })
  vim.api.nvim_set_keymap("x", " ", "", { noremap = true })
end

-- 2. check conda env
function check_conda()
  local venv = os.getenv("CONDA_PREFIX")
  if venv then
    vim.g.python3_host_prog = venv .. "/bin/python"
  end
end

-- 3. create cache dir recursively
function createdir()
  local data_dir = {
    global.cache_dir .. "backup",
    global.cache_dir .. "session",
    global.cache_dir .. "swap",
    global.cache_dir .. "tags",
    global.cache_dir .. "undo",
  }
  -- There only check once that If cache_dir exists
  -- Then I don't want to check subs dir exists
  if vim.fn.isdirectory(global.cache_dir) == 0 then
    os.execute("mkdir -p " .. global.cache_dir)
    for _, v in pairs(data_dir) do
      if vim.fn.isdirectory(v) == 0 then
        os.execute("mkdir -p " .. v)
      end
    end
  end
end

-- main the entrypoint
local packer = require("core.pack")

-- 1. create cache dir
createdir()
-- 2. initlize leader keymap
leader_map()

-- 3. load modules
require("core.options")
require("core.mapping")
require("keymap")
