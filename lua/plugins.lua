local nvim_cmd = vim.api.nvim_command

-- initlize packer
local init_packer = function()
  target_dir = os.getenv("HOME") .. "/.local/share/nvim/site/pack/packer/start/packer.nvim"
  if not vim.loop.fs_stat(target_dir) then
    install_cmd = "!git clone git@github.com:wbthomason/packer.nvim.git " .. target_dir
    vim.api.nvim_command(install_cmd)
  end
end

---Config autoupdate packer when current file is update
local auto_update = function autoupdate()
  vim.cmd([[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
  ]])
end

local status, packer = pcall(require, 'packer')
if not status then
  print("Packer is not installed")
  print("initialize packer firstly")

  init_packer()
  auto_update()

  print("install success, please enter arbitary key for next step")
end

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage ifself
  use 'wbthomason/packer.nvim'

  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim' }
  }

  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'L3MON4D3/LuaSnip' -- Snippet
  use 'hoob3rt/lualine.nvim' -- Statusline

  use 'glepnir/lspsaga.nvim' -- LSP UIS
  use 'neovim/nvim-lspconfig' -- LSP config

  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim`s built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more vai LUA
  use 'MunifTanjim/prettier.nvim' -- Prettier pluigin for Neovim`s built-in LSP client

  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'akinsho/nvim-bufferline.lua'
  use 'norcalli/nvim-colorizer.lua'

  use 'lewis6991/gitsigns.nvim'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
end)
