local utils = require("utils")
local fn = vim.fn

-- The root dir to install all plugins. Plugins are under opt/ or start/ sub-directory.
vim.g.plugin_home = fn.stdpath("data") .. "/site/pack/packer"

-- Where to install packer.nvim -- the package manager (we make it opt)
local packer_dir = vim.g.plugin_home .. "/opt/packer.nvim"

