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

-- Check the plugin is exists in lazy.core.config?
---@param plugin? string
function isPluginExists(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

-- On attach on LspAttach event
---@param on_attach function(client, buffer)
function LspAttach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end
  })
end

--- Get the dunamic terminal size
---@param direction number
---@param size number default is 20
function GetDynamicTerminalSize(direction, size)
  size = size or 20
  if direction ~= "float" and tostring(size):find(".", 1, true) then
    size = math.min(size, 1.0)
    local buf_sizes = GetBufferSize()
    local buf_size = direction == "horizontal" and buf_sizes.height or buf_sizes.width
    return buf_size * size
  else
    return size
  end
end

--- Get current buffer size
---@return {width: number, height: number}
function GetBufferSize()
  local cbuf = vim.api.nvim_get_current_buf()
  local bufinfo = vim.tbl_filter(function(buf)
    return buf.bufnr == cbuf
  end, vim.fn.getwininfo(vim.api.nvim_get_current_win()))[1]
  if bufinfo == nil then
    return { width = -1, height = -1 }
  end
  return { width = bufinfo.width, height = bufinfo.height }
end

--- Detect is target file exists
---@param file string
function IsFileExists(file)
  local stat = vim.loop.fs_stat(file)
  return stat and stat.type == "file"
end
