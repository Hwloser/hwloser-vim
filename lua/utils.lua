local fn = vim.fn

function _G:inspect(item)
  vim.pretty_print(item)
end

local M = {}

function M.executable(name)
  if fn.executable(name) > 0 then
    return true
  end
  return false
end

--- Create a dir if it does not exists
function M.may_create_dir(dir)
  local res = fn.isdirectory(dir)

  if res == 0 then
    fn.mkdir(dir, 'p')
  end
end

function M.get_nvim_version()
  local ver = vim.version()
  local nvim_ver_str = string.format("%d.%d.%d", ver.major, ver.minor, ver.patch)
  return nvim_ver_str
end

function M.rand_int(low, high)
  math.randomseed(os.time())
  return math.random(low, high)
end

--- Select a random element from a list
--- @seq: the list to choose an element
function M.rand_element(list)
  local idx = M.rand_int(1, #list)
  return list[idx]
end

function M.add_pack(name)
  local status, error = pcall(vim.cmd, "packadd " .. name)
  return status
end

return M
