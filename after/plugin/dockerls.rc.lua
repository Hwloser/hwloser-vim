local status, lsp = pcall(require, 'lspconfig')
if not status then return end

lsp.dockerls.setup {
  -- default values
  -- url: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  -- cmd = { "docker-langserver", "--stdio" },

}
