--[[
-- Functions utilities
--]]

-- Detect if luarocks has been installed in local machine
-- @function has_luarocks
-- @treturn boolean Wether detect luarocks
function HasLuarocks()
  local cmd = "luarocks --version > /dev/null 2>&1"
  return os.execute(cmd) == 0
end

-- Try install luarocks
function TryToInstallLuarocks()
  -- 1. Define the action of each os_arch
  local actions = {
    ["Linux"] = function()
      -- Debian / Ubuntu
      os.execute("echo 'please wait a minute, we try to install luarocks'")
      os.execute("sudo apt-get update")
      os.execute("sudo apt-get install -y luarocks")
      return true
    end,
    ["Darwin"] = function()
      -- MacOS
      os.execute("echo 'please wait a minute, we try to install luarocks'")
      os.execute("brew update && brew install luarocks")
      return true
    end,
    ["Windows"] = function()
      -- Windows
      vim.api.nvim_err_writeln("Failed to install luarocks, please install by yourself in windows!! " ..
        " target URL: https://luarocks.org/windows")
      return false
    end
  }

  -- 2. Check the os_info
  local os_info = io.popen("uname -s"):read("*l")

  if actions[os_info] then
    return actions[os_info]()
  else
    return false
  end
end

-- Load the mapConfigs to vim.keymap
---@tparam mapConfigs the keymap config
function LoadMapConfigs(mapConfigs)
  for _, mapdef in pairs(mapConfigs) do
    local maps = mapdef.maps
    -- 2.1 check if the maps setting is empty, then we skip
    if next(maps) == nil then
      -- TODO: log here
      goto continue
    end

    -- 2.2 set maps
    local mode = mapdef.abbreviation
    local opt = mapdef.opts

    for k, v in pairs(maps) do
      vim.keymap.set(mode, k, v, opt)
    end

    ::continue::
  end
end

-- backup:
-- function GetGitRootDirectory()
--   local handle = io.popen('git rev-parse --show-toplevel')
--   local result = handle:read("*a")
--   handle:close()
--   result = result:gsub('\n', '') -- remove the newline at the end of the string
--   return result
-- end
function GetGitRootDirectory()
  local current_dir = debug.getinfo(1, "S").source:sub(2)
  while current_dir ~= '' do
    local stat = vim.loop.fs_stat(current_dir .. '/.git')
    if stat and stat.type == 'directory' then
      return current_dir
    end
    current_dir = vim.fn.fnamemodify(current_dir, ':h')
  end
  return nil
end

-- The path seperate for each OS_ARCH
local pse = vim.loop.os_uname().version:match "Windows" and "\\" or "/"

function JoinSep(...)
  return table.concat({ ... }, pse)
end

function JoinDot(...)
  return table.concat({ ... }, '.')
end

function Split(str, delimiter)
  local result = {}
  for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
end

-- Simple merge the right table into left:
--   for k, v in pairs(right) do
--     left[k] = v
--   end
function SimpleMergeInLeft(left, right)
  for k, v in pairs(right) do
    left[k] = v
  end
  return left
end

---@param ... table
---@return table
function MergeTable(...)
  local t = {}
  for _, v in ipairs { ... } do
    table.insert(t, v)
  end
  return t
end

---List file under the directory
-- Note that, file name will be remove the ending '.lua' flag
---@param directory?string
---@param pattern?string
function ListFiles(directory, pattern)
  local files = {}
  local handle = vim.loop.fs_scandir(directory)
  if not handle then
    return files
  end
  repeat
    local name, t = vim.loop.fs_scandir_next(handle)
    if name and t == "file" and name:match(pattern) then
      local truncName = name:gsub("%.lua$", "")
      table.insert(files, truncName)
    end
  until not name
  return files
end

-- this will return a function that calls telescope.
-- for `files`, git_files or find_files will be chosen depending on .git
function Telescope(builtin, opts)
  local params = { builtin = builtin, opts = opts }
  return function()
    builtin = params.opts
    opts = params.opts
    opts = vim.tbl_deep_extend("force", { cwd = GetGitRootDirectory() }, opts or {})
    if builtin == "files" then
      if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. "/.git") then
        opts.show_untracked = true
        builtin = "git_files"
      else
        builtin = "find_files"
      end
    end
  end
end
