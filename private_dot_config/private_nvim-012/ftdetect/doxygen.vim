" support the Notes aliases in my zshkit.
augroup doxygen_doc_ftdetect
  autocmd!
  autocmd Bufread,BufNewFile *.doc set filetype=doxygen
augroup end
