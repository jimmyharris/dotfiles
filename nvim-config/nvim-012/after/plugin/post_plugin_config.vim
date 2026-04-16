" These configurations must occur after plugins load in order to insure that
" we can detect if a plugin was loaded or not.

" Tabularize: {{{
if exists(":Tabularize")
  " Tabularize on '='. Good for aligning assignment of variables.
  nmap <Leader>= :Tabularize /=<CR>
  vmap <Leader>= :Tabularize /=<CR>
  " tabularize on ':'. This does not center the : in the tabularization.
  " Good for JSON formatting.
  nmap <Leader>: :Tabularize /:\zs<CR>
  vmap <Leader>: :Tabularize /:\zs<CR>
endif
" }}}

