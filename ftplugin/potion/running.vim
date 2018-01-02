" Support for compiling and running Potion files
" Mappings for potion compilers. Defined in autoload/potion/running.vim
nnoremap <silent> <buffer> <leader>r :call potion#running#PotionCompileAndRunFileOnVim()<cr>
nnoremap <silent> <buffer> <leader>rt :call potion#running#PotionCompileAndRunFileTerminal()<cr>
nnoremap <silent> <buffer> <leader>b :call potion#running#PotionShowBytecode()<cr>
