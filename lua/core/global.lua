local options = {}
local os_name = vim.loop.os_uname().sysname
-- local hvim_path_prefix = "hvim/"

function options:load_variables()
  self.is_mac = os_name == "Darwin"
  self.is_linux = os_name == "Linux"
  self.is_windows = os_name == "Windows_NT"

  self.separate = self.is_windows and "\\" or "/"

  -- vim config path
  -- ex: /Users/huanwei/.config/nvim
  self.vim_config_path = vim.fn.stdpath("config")
  -- ex: /Users/huanwei/.local/share/nvim
  self.vim_data_path = vim.fn.stdpath("data")
  self.home_path = self.is_windows and os.getenv("USERPROFILE") or os.getenv("HOME")

  -- temp define variables
  self.home = self.home_path
  self.cache_dir = self.home .. self.separate .. ".cache" .. self.separate .. "nvim" .. self.separate
  self.vim_path = self.vim_config_path
  self.modules_dir = self.vim_path .. self.separate .. "modules"
  self.data_dir = string.format("%s/site/", vim.fn.stdpath("data"))
end

options:load_variables()

return options
