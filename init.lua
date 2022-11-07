require("base")
require("highlights")
require("maps")
require("plugins")

local machine = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = machine "macunix"
local is_win = machine "win32"
local is_linux = machine "linux"

if is_mac or is_linux then
  require('macos')
elseif is_win then
  require('windows')
end
