-- Tips:
-- please set this parameters to define custom runtime_path
-- 1. HVIM_RUNTIME_DIR - ( data )
-- 2.


---Get runtime base dir path
---Default is vim.call("stdpath", "data")
---@return string
function get_runtime_dir()
  local runtime_dir = os.getenv "HVIM_RUNTIME_DIR"
  if not runtime_dir then
    -- use default data directory, when runtime_dir is not define
    return vim.call("stdpath", "data")
  end
  return runtime_dir
end

---Get the config base dir path
---@return string
function get_config_dir()
  local config_dir = os.getenv "HVIM_CONFIG_DIR"
  if not config_dir then
    return vim.call("stdpath", "config")
  end
  return config_dir
end

---Get the cache base dir path
---@return string
function _G:get_cache_dir()
  local cache_dir = os.getenv "HVIM_CACHE_DIR"
  if not cache_dir then
    return vim.call("stdpath", "cache")
  end
  return cache_dir
end

function M:init(base_dir)
  self.runtime_dir = get_runtime_dir()
  self.config_dir = get_config_dir()
  self.cache_dir = get_cache_dir()

  self.packer_dir = join_paths(
    self.runtime_dir,
    "site",
    "pack"
  )
  self.packer_install_dir = join_paths(
    self.runtime_dir,
    "site",
    "pack",
    "packer",
    "start",
    "packer.nvim"
  )
  self.packer_cache_path = join_paths(
    self.config_dir,
    "plugin",
    "pacler_compiled.lua"
  )

end
