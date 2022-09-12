let g:is_win = (has('win32') || has('win64')) ? v:true : v:false
let g:is_linux = (has("unix") && !has("macunix")) ? v:true : v:false
let g:is_mac = has("macunix") ? v:true : v:false
let g:logging_level = "info"

let g:loaded_perl_provider = 0 " Disable perl provider
" let g:loaded_ruby_provider = 0 " Disable ruby provider
" let g:loaded_node_provider = 0 " Disable node provider

" Path to python3 interpreter (must  be an absolute path), make startup
" faster. See https://neovim.io/doc/user/provider.html.
if executable('python')
  if g:is_win
    let g:python3_host_prog = substitute(exepath('python'), '.exe$', '', 'g')
  elseif g:is_linux || g:is_mac
    lef g:python3_host_prog = exepath('python')
  endif
else
  echoerr 'Python 3 executable not found! You must install Python 3 and set its PATH correctly!'
endif

" Custom mapping <leader>(see `:h mapleader` for more info)
let g:mapleader = ' '

" Enable highlighting for lua HERE doc inside vim script
let g:vimsyn_embed = 'l'

" Use English as main language
if !g:is_mac
  language en_US.utf-8
endif

" use filetype.lua instead of filetype.vim
let g:do_filetype_lua = 1  " Enable lua file type detected
let g:did_load_filetypes = 0

" Disable loading certain plugins
" let g:loaded_netrw = 1
" let g:loaded_netrwPlugin = 1
" let g:netrw_liststyle = 3
if g:is_win
  let g:netrw_http_cmd = 'curl --ssl-no-revoke -Lo'
endif

" Do not load tohtml.vim
" let g:loaded_2html_plugin = 1
" let loaded_gzip = 1
" let g:loaded_tarPlugin = 1

let g:loaded_tutor_mode_plugin = 1 " do not load the tutor plugin

" Do not use builtin matchit.vim and matchparen.vim
" since we use vim-matchup
let g:loaded_matchit = 1
let g:loaded_matchparen = 1

" Disable sql omni completion, it is broken.
let g:loaded_sql_completion = 1

