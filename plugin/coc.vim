fun! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfun
fun! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfun
autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" Highlight symbol and references
autocmd CursorHold * silent call CocActionAsync('highlight')

" Tab and shift-tab navigate auto-complete suggestions
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Tab selects auto-complete suggestion
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ CheckBackspace() ?
"       \ '\<C-g>u\<TAB>' :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? '\<C-p>' : '\<C-h>'
" fun! CheckBackspace() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1] =~# '\s'
" endfun

" Spacebar triggers completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Code actions
nmap <leader>do <Plug>(coc-codeaction)
