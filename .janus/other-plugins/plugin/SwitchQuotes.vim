""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SwitchQuotes.vim - switches quotes
" Version: 1.1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:debug = 1

" check if script is already loaded
if s:debug == 0 && exists("g:loaded_SwitchQuotes")
    finish "stop loading the script"
endif
let g:loaded_SwitchQuotes = 1

let s:global_cpo = &cpo " store compatible-mode in local variable
set cpo&vim             " go into nocompatible-mode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:ToggleQuote()
  let q   = searchpos("'", 'n',  line('.'))
  let qb  = searchpos("'", 'bn', line('.'))
  let dq  = searchpos('"', 'n',  line('.'))
  let dqb = searchpos('"', 'bn', line('.'))

  if q[0] > 0 && qb[0] > 0 && (dq[0] == 0 || dq[0] > q[0])
    execute "normal mzcs'\"`normalz"
  elseif dq[0] > 0 && dqb[0] > 0
    execute "normal mzcs\"'`z"
  endif
endfunction

nnoremap <silent>'  :<C-U>call <SID>ToggleQuote()<CR>
