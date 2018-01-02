" Autoloader for Potion's compiler called by mapping in ftplugin/potion/running.vim
echom "Autoloading..."

" Let users set a filepath for potion command if it is not in $PATH
if !exists("g:potion_command")
    let g:potion_command = "potion"
endif

" wrapper function to run any potion command and spit output into a Vim Buffer
function! potion#running#RunPotionCommand(command)
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
        " Open a new window when previously created buffer does not exist 
        " Underscores indicate this is buffer,not a normal file
        let potionbuf = bufwinnr('__Potion_Bytecode__')
        if ( potionbuf == -1)
            vsplit __Potion_Bytecode__
        else
            execute potionbuf . "wincmd w"  
        endif
        " Delete everything in this buffer (for using this buffer more than once
        silent normal! ggdG
        " set file type
        setlocal filetype=potionbytecode
        " buftype=nofile tells Vim that it should never write to disk
        setlocal buftype=nofile
        call append(0, split(bytecode, '\v\n'))
    endif
endfunction

function! potion#running#PotionCompileAndRunFileTerminal()
    "clear the terminal screen
    silent !clear
    execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! potion#running#PotionCompileAndRunFileOnVim()
    call potion#running#RunPotionCommand(" ") 
endfunction

function! potion#running#PotionShowBytecode()
    call potion#running#RunPotionCommand(" -c -V ") 
endfunction
