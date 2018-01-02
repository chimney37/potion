" Support for compiling and running Potion files
" Mappings for potion compilers. Defined in autoload/potion/running.vim
nnoremap <silent> <buffer> <localleader>r :call potion#running#PotionCompileAndRunFileOnVim()<cr>
nnoremap <silent> <buffer> <localleader>rt :call potion#running#PotionCompileAndRunFileTerminal()<cr>
nnoremap <silent> <buffer> <localleader>b :call potion#running#PotionShowBytecode()<cr>
