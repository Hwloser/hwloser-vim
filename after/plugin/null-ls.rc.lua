local status, null_ls = pcall(require, 'null-ls')
if not status then return end

-- null_ls.setup {
--   on_attach = function(client, bufnr)
--     if client.server_capbilities.documentFormattingProvider then
--       vim.api.nvim_command [[augroup Format]]
--       vim.api.nvim_command [[autocmd! * <buffer>]]
--       vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.formatting_seq_sync()]]
--       vim.api.nvim_command [[augroup END]]
--     end
--   end,
--   sources = {
--     null_ls.builtins.diagnostics.eslint_d.with({
--       dignostics_format = '[eslint] #{m}\n(#{c})'
--     }),
--     null_ls.builtins.diagnostics.fish
--   }
-- }
