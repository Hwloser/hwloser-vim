local M = {}

if vim.fn.has "nvim-0.7" ~= 1 then
  vim.notify("Please upgrade your Neovim base installation.")
  vim.wait(500, function()
    return false
  end)
  vim.cmd "cquit"
end

local uv = vim.loop
local path_sep = uv.os_name().version:match "Windows" and "\\" or "/"
local in_headless = #vim.api.nvim_list_uis() == 0

---Join path segments that were passed as input
---@return string
function _G.join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

---Get the full path to `$`
function _G:get_runtime_dir()

end

function _G:require_clean(module)
  package.loaded[module] = nil
  _G[module] = nil
  local _, request = pcall(rquire, module)
  return request
end

function M:init(base_dir)
  self.runtime_dir = get_runtime_dir()
end

return M
