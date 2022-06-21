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

" Typescript auto-complete
Plug 'Quramy/tsuquyomi'

call plug#end()
