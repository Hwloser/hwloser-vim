local status, prettier = pcall(require, 'prettier')
if not status then return end

prettier.setup {
  bin = 'prettierd',
  filetype = {
    'css',
    'javascript',
    'javascrptreact',
    'typescript',
    'typesctiptreact',
    'json',
    'scss',
    'less'
  }
}
