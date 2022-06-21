" vscode vimrc (currently only supports remapping)
inoremap jk <Esc>
inoremap kj <Esc>

fun! InstallVimPlug()
  let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

  if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endfun

call InstallVimPlug()

call plug#begin()

Plug 'airblade/vim-gitgutter'

" TypeScript auto-complete
"Plug 'Quramy/tsuquyomi'

" TypeScript/React in Vim:
"" Syntax highlighting
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
"" Language server and auto-import
Plug 'neoclide/coc.nvim', {'branch': 'release'}
""" Coc plugins
let g:coc_global_extensions=[
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-tsserver'
      \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions+=['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions+=['coc-eslint']
endif

" Syntax highlight language pack
Plug 'sheerun/vim-polyglot'

call plug#end()
