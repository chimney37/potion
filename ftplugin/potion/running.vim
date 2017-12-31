" Support for compiling and running Potion files
" Let users set a filepath for potion command if it is not in $PATH
if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

function! PotionCompileAndRunFile()
    "clear the terminal screen
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
    " Get the bytecode.
    let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

    " Open a new split and set it up. 
    " Underscores indicate this is buffer,not  normal file
    vsplit __Potion_Bytecode__
    " Delete everything in this buffer (for using this buffer more than once
    normal! ggdG
    " set file type
    setlocal filetype=potionbytecode
    " buftype=nofile tells Vim that it should never write to disk
    setlocal buftype=nofile

    " Insert the bytecode
    if match(bytecode, "** Syntax error") >= 0
        call setqflist([{'bufnr': 0, 'text': bytecode}], 'a')
    endif
    call append(0, split(bytecode, '\v\n'))
endfunction

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>

nnoremap <buffer> <localleader>b :call PotionShowBytecode()<cr>
