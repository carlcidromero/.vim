" vscode vimrc (currently only supports remapping)
inoremap jk <Esc>
inoremap kj <Esc>

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()

Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'

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
let g:polyglot_disabled = ['jsx']

call plug#end()

