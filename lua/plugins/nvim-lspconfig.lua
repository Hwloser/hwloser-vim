-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      servers = {
        clangd = {
          cmd = {
            "/Users/huanwei/git_files/huanwei/clangd/bin/clangd",
            "--clang-tidy",
            "--all-scopes-completion", -- 全代码库补全
            "--completion-style=detailed", -- 详细补全
            "--header-insertion=iwyu",
            "--pch-storage=memory",
            "--background-index", --
            "-j=8", -- 后台线程数
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
        },
      },
    },
  },
}
