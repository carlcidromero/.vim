" Rescan entire buffer when highlighting js/ts files
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

colorscheme gruvbox

filetype indent on
filetype on
filetype plugin on

syntax on
