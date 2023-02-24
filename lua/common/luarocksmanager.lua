--[[
-- Standby a luarocks package manager
--]]

require "common.utilities"

-- 1. Check if luarocks has been installed.
-- If not, then we will install automatically.
if not HasLuarocks() then
  -- try install luarocks
  if not TryToInstallLuarocks() then
    error("Failed to install luarocks, skip load vim plugins")
    return
  end
end

-- 2. load luarocks for LUA_PATH
os.execute("luarocks path --bin > /dev/null")
