" Support for compiling and running Potion files
" Let users set a filepath for potion command if it is not in $PATH
if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

" wrapper function to run any potion command and spit output into a Vim Buffer
function! s:RunPotionCommand(command)
    " Get the bytecode.
    let bytecode = system(g:potion_command . a:command . bufname("%"))
    " if syntax error detected, open the quickfix window.
    " else, insert the bytecode into a new window
    if match(bytecode, "** Syntax error") >= 0
        let lnum = bytecode[match(bytecode, '\v:\d+') + 1]
        "populate the quick fix list
        call setqflist([{'bufnr': bufnr("%"), 'lnum': lnum, 'text': bytecode}], 'r')
        copen
    else
        " clear any quick fix list
        call setqflist([],'r')
        "close any previouly opened quickfix window
        cclose
        " Open a new split and set it up. 
        " Underscores indicate this is buffer,not  normal file
        vsplit __Potion_Bytecode__
        " Delete everything in this buffer (for using this buffer more than once
        normal! ggdG
        " set file type
        setlocal filetype=potionbytecode
        " buftype=nofile tells Vim that it should never write to disk
        setlocal buftype=nofile
        call append(0, split(bytecode, '\v\n'))
    endif
endfunction

function! s:PotionCompileAndRunFileTerminal()
    "clear the terminal screen
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! s:PotionCompileAndRunFileOnVim()
    call <SID>RunPotionCommand(" ") 
endfunction

function! s:PotionShowBytecode()
    call <SID>RunPotionCommand(" -c -V ") 
endfunction

nnoremap <silent> <buffer> <localleader>r :call <SID>PotionCompileAndRunFileOnVim()<cr>
nnoremap <silent> <buffer> <localleader>rt :call <SID>PotionCompileAndRunFileTerminal()<cr>
nnoremap <silent> <buffer> <localleader>b :call <SID>PotionShowBytecode()<cr>
