" Auto Commands: {{{
" Put these in a group so that we don't repeatedly add them on subequent
" reloads
augroup vim_config_ftdetect
  " Clear the group
  autocmd!

  " Set fold methods for vimrc for easier navigation.
  autocmd Bufread vimrc set foldmethod=marker
  autocmd Bufread .vimrc set foldmethod=marker
  autocmd Bufread _vimrc set foldmethod=marker
  autocmd Bufread init.vim set foldmethod=marker
  autocmd Bufread ginit.vim set foldmethod=marker
augroup end

" }}}
